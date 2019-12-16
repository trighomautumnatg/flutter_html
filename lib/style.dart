import 'package:flutter/material.dart';

///This class represents all the available CSS attributes
///for this package
class Style {
  ///CSS attribute "`background-color`"
  Color backgroundColor;

  ///CSS attribute "`color`"
  Color color;

  ///CSS attribute "`display`"
  Display display;

  ///CSS attribute "`font-family`"
  String fontFamily;

  ///CSS attribute "`font-size`"
  FontSize fontSize;

  ///CSS attribute "`font-style`"
  FontStyle fontStyle;

  ///CSS attribute "`font-weight`"
  FontWeight fontWeight;

  ///CSS attribute "`height`"
  double height;

  ///CSS attribute "`list-style-type`"
  ListStyleType listStyleType;

  ///CSS attribute "`padding`"
  EdgeInsets padding;

  ///CSS attribute "`margin`"
  EdgeInsets margin;

  /// CSS attribute "`ruby-align`"
  ///
  /// inherited: yes,
  /// default: [RubyAlign.CENTER] (SPACE_AROUND currently unsupported),
  RubyAlign rubyAlign;

  /// CSS attribute "`ruby-merge`"
  ///
  /// inherited: yes,
  /// default: [RubyMerge.SEPARATE],
  RubyMerge rubyMerge;

  /// CSS attribute "`ruby-position`"
  ///
  /// inherited: yes,
  /// default: [RubyPosition.OVER],
  RubyPosition rubyPosition;

  ///CSS attribute "`text-decoration`" -
  TextDecoration textDecoration;

  ///CSS attribute "`text-decoration-style`" -
  TextDecorationStyle textDecorationStyle;

  ///CSS attribute "`vertical-align`"
  VerticalAlign verticalAlign;

  ///CSS attribute "`white-space`"
  WhiteSpace whiteSpace;

  ///CSS attribute "`width`"
  double width;

  //TODO modify these to match CSS styles
  String before;
  String after;
  TextDirection textDirection;
  Border border;
  Alignment alignment;
  String markerContent;

  Style({
    this.backgroundColor,
    this.color,
    this.display,
    this.fontFamily,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.height,
    this.listStyleType,
    this.padding,
    this.margin,
    this.rubyAlign,
    this.rubyMerge,
    this.rubyPosition,
    this.textDecoration,
    this.textDecorationStyle,
    this.verticalAlign,
    this.whiteSpace,
    this.width,
    this.before,
    this.after,
    this.textDirection,
    this.border,
    this.alignment = Alignment.centerLeft, //TODO
    this.markerContent,
  });

  //TODO: all attributes of TextStyle likely have a CSS attribute and should be supported.
  TextStyle generateTextStyle() {
    return TextStyle(
      backgroundColor: backgroundColor,
      color: color,
      decoration: textDecoration,
      decorationStyle: textDecorationStyle,
      fontFamily: fontFamily,
      fontSize: fontSize?.size,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
    );
  }

  @override
  String toString() {
    return "Style";
  }

  Style merge(Style other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      color: other.color,
      display: other.display,
      fontFamily: other.fontFamily,
      fontSize: other.fontSize,
      fontStyle: other.fontStyle,
      fontWeight: other.fontWeight,
      height: other.height,
      listStyleType: other.listStyleType,
      padding: other.padding,
      //TODO merge EdgeInsets
      margin: other.margin,
      //TODO merge EdgeInsets
      rubyAlign: other.rubyAlign,
      rubyMerge: other.rubyMerge,
      rubyPosition: other.rubyPosition,
      textDecoration: other.textDecoration,
      textDecorationStyle: other.textDecorationStyle,
      verticalAlign: other.verticalAlign,
      whiteSpace: other.whiteSpace,
      width: other.width,
      before: other.before,
      after: other.after,
      textDirection: other.textDirection,
      border: other.border,
      //TODO merge border
      alignment: other.alignment,
      markerContent: other.markerContent,
    );
  }

  Style copyOnlyInherited(Style child) {
    if (child == null) return this;

    return child.copyWith(
      color: child.color ?? color,
      fontFamily: child.fontFamily ?? fontFamily,
      fontSize: child.fontSize ?? fontSize,
      fontStyle: child.fontStyle ?? fontStyle,
      fontWeight: child.fontWeight ?? fontWeight,
      listStyleType: child.listStyleType ?? listStyleType,
      rubyAlign: child.rubyAlign ?? rubyAlign,
      rubyMerge: child.rubyMerge ?? rubyMerge,
      rubyPosition: child.rubyPosition ?? rubyPosition,
      whiteSpace: child.whiteSpace ?? whiteSpace,
    );
  }

  Style copyWith({
    Color backgroundColor,
    Color color,
    Display display,
    String fontFamily,
    FontSize fontSize,
    FontStyle fontStyle,
    FontWeight fontWeight,
    double height,
    ListStyleType listStyleType,
    EdgeInsets padding,
    EdgeInsets margin,
    RubyAlign rubyAlign,
    RubyMerge rubyMerge,
    RubyPosition rubyPosition,
    TextDecoration textDecoration,
    TextDecorationStyle textDecorationStyle,
    VerticalAlign verticalAlign,
    WhiteSpace whiteSpace,
    double width,
    bool preserveWhitespace,
    int baselineOffset,
    String before,
    String after,
    TextDirection textDirection,
    Border border,
    Alignment alignment,
    String markerContent,
  }) {
    return Style(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      color: color ?? this.color,
      display: display ?? this.display,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ?? this.fontStyle,
      fontWeight: fontWeight ?? this.fontWeight,
      height: height ?? this.height,
      listStyleType: listStyleType ?? this.listStyleType,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      rubyAlign: rubyAlign ?? this.rubyAlign,
      rubyMerge: rubyMerge ?? this.rubyMerge,
      rubyPosition: rubyPosition ?? this.rubyPosition,
      textDecoration: textDecoration ?? this.textDecoration,
      textDecorationStyle: textDecorationStyle ?? this.textDecorationStyle,
      verticalAlign: verticalAlign ?? this.verticalAlign,
      whiteSpace: whiteSpace ?? this.whiteSpace,
      width: width ?? this.width,
      before: before ?? this.before,
      after: after ?? this.after,
      textDirection: textDirection ?? this.textDirection,
      border: border ?? this.border,
      alignment: alignment ?? this.alignment,
      markerContent: markerContent ?? this.markerContent,
    );
  }

  Style.fromTextStyle(TextStyle textStyle) {
    this.backgroundColor = textStyle.backgroundColor;
    this.color = textStyle.color;
    this.textDecoration = textStyle.decoration;
    this.textDecorationStyle = textStyle.decorationStyle;
    this.fontFamily = textStyle.fontFamily;
    this.fontSize = FontSize(textStyle.fontSize);
    this.fontStyle = textStyle.fontStyle;
    this.fontWeight = textStyle.fontWeight;
  }
}

enum Display {
  BLOCK,
  INLINE,
  INLINE_BLOCK,
  LIST_ITEM,
  RUBY,
  RUBY_BASE,
  RUBY_TEXT,
  RUBY_BASE_CONTAINER,
  RUBY_TEXT_CONTAINER,
}

class FontSize {
  final double size;

  const FontSize(this.size);

  /// A percentage of the parent style's font size.
  factory FontSize.percent(int percent) => FontSize(percent.toDouble() / -100.0);

  // These values are calculated based off of the default (`medium`)
  // being 14px.
  //
  // TODO(Sub6Resources): This seems to override Flutter's accessibility text scaling.
  //
  // Negative values are computed during parsing to be a percentage of
  // the parent style's font size.
  static const xxSmall = FontSize(7.875);
  static const xSmall = FontSize(8.75);
  static const small = FontSize(11.375);
  static const medium = FontSize(14.0);
  static const large = FontSize(15.75);
  static const xLarge = FontSize(21.0);
  static const xxLarge = FontSize(28.0);
  static const smaller = FontSize(-0.83);
  static const larger = FontSize(-1.2);
}

enum ListStyleType {
  DISC,
  DECIMAL,
}

enum RubyAlign {
  START,
  CENTER,
  //UNSUPPORTED: SPACE_BETWEEN,
  //UNSUPPORTED: SPACE_AROUND,
}

enum RubyMerge {
  SEPARATE,
  COLLAPSE,
  //UNSUPPORTED: AUTO,
}

enum RubyPosition {
  OVER,
  UNDER,
  INTER_CHARACTER,
}

enum VerticalAlign {
  BASELINE,
  SUB,
  SUPER,
}

enum WhiteSpace {
  NORMAL,
  PRE,
}
