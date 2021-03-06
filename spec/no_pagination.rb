# Frozen-string-literal: true
# Copyright: Since 2017 Tamanguu GmbH & Co KG - MIT License
# Encoding: utf-8

require 'jekyll-category-pages'

basedir = 'spec/test/_site1/category/'
jekyll = basedir + 'jekyll/'
haodezhuyi = basedir + '%E5%A5%BD%E7%9A%84%E4%B8%BB%E6%84%8F/'
plugin = basedir + 'Category+Pages+Plugin/'
index = 'index.html'

describe Jekyll::CategoryPages do
  context "no_pagination" do
    it "category indices exists" do
      expect(File.file? jekyll+index).to be true
      expect(File.file? haodezhuyi+index).to be true
      expect(File.file? plugin+index).to be true
    end

    it "category jekyll is correct" do
      load jekyll+index
      expect($page_title).to eql('jekyll')
      expect($page_category).to eql('jekyll')
      expect($page_total_posts).to eql(5)
      expect($page_posts_title).to eql([ "More about Jekyll", "Everything you always wanted to know about Jekyll", "About the plugin", "Welcome to the plugin", "Welcome to Jekyll!" ])
    end

    it "category 好的主意 is correct" do
      load haodezhuyi+index
      expect($page_title).to eql('好的主意')
      expect($page_category).to eql('好的主意')
      expect($page_total_posts).to eql(1)
      expect($page_posts_title).to eql([ "Welcome to the plugin" ])
    end

    it "category Category Pages Plugin is correct" do
      load plugin+index
      expect($page_title).to eql('Category Pages Plugin')
      expect($page_category).to eql('Category Pages Plugin')
      expect($page_total_posts).to eql(2)
      expect($page_posts_title).to eql([ "About the plugin", "Welcome to the plugin" ])
    end
  end
end
