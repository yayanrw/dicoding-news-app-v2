import 'dart:convert';
import 'package:news_app_v2/data/model/article.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = 'newsapi.org';
  static final String _apiKey = '1bd9658980344864b8dcb14140acb7e4';
  static final String _category = 'business';
  static final String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.https(_baseUrl, "/v2/top-headlines",
        {'country': _country, 'category': _category, 'apiKey': _apiKey}));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    } 
  }
}
