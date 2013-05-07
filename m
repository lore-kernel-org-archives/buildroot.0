From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 15:19:22 +0200
Subject: [Buildroot] [git commit] jquery-ui-themes: use a choice option for
	theme name
Message-ID: <20130507133103.4D87799AD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a61ef8194bf9e4cf8428005cb02b436d2fb31aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A bit more user friendly than asking people to figure out the available
themes manually.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-ui-themes/Config.in |  113 ++++++++++++++++++++++++++++++++++--
 1 files changed, 108 insertions(+), 5 deletions(-)

diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index 9a15140..5168f37 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -6,9 +6,112 @@ config BR2_PACKAGE_JQUERY_UI_THEMES
 
 	  http://jqueryui.com/
 
-config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
-	string "theme to install"
-	default "ui-lightness"
-	depends on BR2_PACKAGE_JQUERY_UI_THEMES
+if BR2_PACKAGE_JQUERY_UI_THEMES
+
+choice
+	prompt "theme to install"
 	help
-	  Specify the name of the jQuery UI theme to install.
+	  Specify the jQuery UI theme to install.
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
+	       bool "black-tie"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
+	       bool "blitzer"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
+	       bool "cupertino"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
+	       bool "dark-hive"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
+	       bool "dot-luv"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
+	       bool "eggplant"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
+	       bool "excite-bike"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_FLICK
+	       bool "flick"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
+	       bool "hot-sneaks"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
+	       bool "humanity"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
+	       bool "le-frog"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
+	       bool "mint-choc"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
+	       bool "overcast"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
+	       bool "pepper-grinder"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
+	       bool "redmond"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
+	       bool "smoothness"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
+	       bool "south-street"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_START
+	       bool "start"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
+	       bool "sunny"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
+	       bool "swanky-purse"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
+	       bool "trontastic"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
+	       bool "ui-darkness"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
+	       bool "ui-lightness"
+
+	config BR2_PACKAGE_JQUERY_UI_THEME_VADER
+	       bool "vader"
+
+endchoice
+
+config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
+	string
+	default "black-tie"		if BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
+	default "blitzer"		if BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
+	default "cupertino"		if BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
+	default "dark-hive"		if BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
+	default "dot-luv"		if BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
+	default "eggplant"		if BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
+	default "excite-bike"		if BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
+	default "flick"			if BR2_PACKAGE_JQUERY_UI_THEME_FLICK
+	default "hot-sneaks"		if BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
+	default "humanity"		if BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
+	default "le-frog"		if BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
+	default "mint-choc"		if BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
+	default "overcast"		if BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
+	default "pepper-grinder"	if BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
+	default "redmond"		if BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
+	default "smoothness"		if BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
+	default "south-street"		if BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
+	default "start"			if BR2_PACKAGE_JQUERY_UI_THEME_START
+	default "sunny"			if BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
+	default "swanky-purse"		if BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
+	default "trontastic"		if BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
+	default "ui-darkness"		if BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
+	default "ui-lightness"		if BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
+	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEME_UI_VADER
+
+endif
