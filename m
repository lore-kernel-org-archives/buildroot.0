From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  7 Aug 2015 14:10:09 +0200
Subject: [Buildroot] [PATCH v2] jQuery: introduce external plugin menu
Message-ID: <1438949409-17023-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

List all jQuery plugins in a dedicated menu and remove
uneeded jQuery selection.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: make packages prompt lowercase and hyphenated

 package/Config.in                       | 4 ++++
 package/jquery-datetimepicker/Config.in | 1 -
 package/jquery-keyboard/Config.in       | 3 +--
 package/jquery-sparkline/Config.in      | 3 +--
 package/jquery-ui-themes/Config.in      | 2 +-
 package/jquery-ui/Config.in             | 3 +--
 package/jquery-validation/Config.in     | 3 +--
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..55a4576 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -888,6 +888,8 @@ menu "Javascript"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
+if BR2_PACKAGE_JQUERY
+menu "external jQuery plugins"
 	source "package/jquery-datetimepicker/Config.in"
 	source "package/jquery-keyboard/Config.in"
 	source "package/jquery-mobile/Config.in"
@@ -895,6 +897,8 @@ menu "Javascript"
 	source "package/jquery-ui/Config.in"
 	source "package/jquery-ui-themes/Config.in"
 	source "package/jquery-validation/Config.in"
+endmenu
+endif
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
 endmenu
diff --git a/package/jquery-datetimepicker/Config.in b/package/jquery-datetimepicker/Config.in
index 6a07ec3..9da3718 100644
--- a/package/jquery-datetimepicker/Config.in
+++ b/package/jquery-datetimepicker/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_DATETIMEPICKER
 	bool "jquery-datetimepicker"
-	select BR2_PACKAGE_JQUERY
 	help
 	  Use this plugin to unobtrusively add a datetimepicker,
 	  datepicker or timepicker dropdown to your forms.
diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
index e44193e..117c4a5 100644
--- a/package/jquery-keyboard/Config.in
+++ b/package/jquery-keyboard/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_KEYBOARD
-	bool "jQuery keyboard"
-	select BR2_PACKAGE_JQUERY
+	bool "jquery-keyboard"
 	select BR2_PACKAGE_JQUERY_UI
 	help
 	  Virtual Keyboard using jQuery UI
diff --git a/package/jquery-sparkline/Config.in b/package/jquery-sparkline/Config.in
index ae66364..1741a29 100644
--- a/package/jquery-sparkline/Config.in
+++ b/package/jquery-sparkline/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_SPARKLINE
-	bool "jQuery-Sparkline"
-	select BR2_PACKAGE_JQUERY
+	bool "jquery-sparkline"
 	help
 	  This jQuery plugin generates sparklines (small inline
 	  charts) directly in the browser using data supplied either
diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index bea1a43..a7ae11e 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_JQUERY_UI_THEMES
-	bool "jQuery UI themes"
+	bool "jquery-ui-themes"
 	depends on BR2_PACKAGE_JQUERY_UI
 	help
 	  Themes for jQuery UI.
diff --git a/package/jquery-ui/Config.in b/package/jquery-ui/Config.in
index f1653d5..a7c0a6d 100644
--- a/package/jquery-ui/Config.in
+++ b/package/jquery-ui/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_UI
-	bool "jQuery UI"
-	select BR2_PACKAGE_JQUERY
+	bool "jquery-ui"
 	help
 	  jQuery UI provides abstractions for low-level interaction and
 	  animation, advanced effects and high-level, themeable widgets,
diff --git a/package/jquery-validation/Config.in b/package/jquery-validation/Config.in
index ab2ee26..39e898e 100644
--- a/package/jquery-validation/Config.in
+++ b/package/jquery-validation/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_VALIDATION
-	bool "jQuery-Validation"
-	select BR2_PACKAGE_JQUERY
+	bool "jquery-validation"
 	help
 	  The jQuery Validation Plugin provides drop-in validation for
 	  your existing forms, while making all kinds of
-- 
1.9.1
