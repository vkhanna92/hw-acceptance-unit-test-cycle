require 'rails_helper'

describe Movie do
  describe '.find_similar_movies' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'Jurassic Park', director: 'Steven Spielberg') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'Seven', director: 'David Fincher') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "Harry Potter", director: 'David Yates') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "Horrible Bosses") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(movie1.title)).to eql(['Harry Potter', "David Yates"])
        expect(Movie.similar_movies(movie1.title)).to_not include(['Seven'])
        expect(Movie.similar_movies(movie2.title)).to eql(['Seven'])
      end
    end

  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end