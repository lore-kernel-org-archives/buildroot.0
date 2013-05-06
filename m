From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 23:52:41 +0200
Subject: [Buildroot] [git commit] jquery-ui-themes: bump version
Message-ID: <20130506221622.9554699C79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea1ece13e219a592e0ea3a4f9d7f1c6d1ef86fb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The base theme is no longer available in the themes download (it is the
standard theme installed by jquery-ui), so default to ui-lightness instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-ui-themes/Config.in           |    2 +-
 package/jquery-ui-themes/jquery-ui-themes.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index dfde9c1..9a15140 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_JQUERY_UI_THEMES
 
 config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
 	string "theme to install"
-	default "base"
+	default "ui-lightness"
 	depends on BR2_PACKAGE_JQUERY_UI_THEMES
 	help
 	  Specify the name of the jQuery UI theme to install.
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index 089d808..3c51b89 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-JQUERY_UI_THEMES_VERSION = 1.8.21
-JQUERY_UI_THEMES_SITE = http://jquery-ui.googlecode.com/files
+JQUERY_UI_THEMES_VERSION = 1.10.3
+JQUERY_UI_THEMES_SITE = http://jqueryui.com/resources/download
 JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip
 JQUERY_UI_THEMES_LICENSE = MIT
 JQUERY_UI_THEMES_LICENSE_FILES = MIT-LICENSE.txt
