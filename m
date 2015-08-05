From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed,  5 Aug 2015 22:01:50 +0200
Subject: [Buildroot] [PATCH] jQuery: introduce external plugin menu
Message-ID: <1438804910-13071-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List all jQuery plugins in a dedicated menu and remove
uneeded jQuery selection.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                       | 4 ++++
 package/jquery-datetimepicker/Config.in | 3 +--
 package/jquery-keyboard/Config.in       | 1 -
 package/jquery-mobile/Config.in         | 2 +-
 package/jquery-sparkline/Config.in      | 1 -
 package/jquery-ui/Config.in             | 1 -
 package/jquery-validation/Config.in     | 1 -
 7 files changed, 6 insertions(+), 7 deletions(-)

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
index 6a07ec3..ae101ca 100644
--- a/package/jquery-datetimepicker/Config.in
+++ b/package/jquery-datetimepicker/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_DATETIMEPICKER
-	bool "jquery-datetimepicker"
-	select BR2_PACKAGE_JQUERY
+	bool "jQuery-datetimepicker"
 	help
 	  Use this plugin to unobtrusively add a datetimepicker,
 	  datepicker or timepicker dropdown to your forms.
diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
index e44193e..3f7a486 100644
--- a/package/jquery-keyboard/Config.in
+++ b/package/jquery-keyboard/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_KEYBOARD
 	bool "jQuery keyboard"
-	select BR2_PACKAGE_JQUERY
 	select BR2_PACKAGE_JQUERY_UI
 	help
 	  Virtual Keyboard using jQuery UI
diff --git a/package/jquery-mobile/Config.in b/package/jquery-mobile/Config.in
index fa31a36..b9d632f 100644
--- a/package/jquery-mobile/Config.in
+++ b/package/jquery-mobile/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_JQUERY_MOBILE
-	bool "jquery-mobile"
+	bool "jQuery-mobile"
 	help
 	  jQuery-Mobile is a unified, HTML5-based user interface
 	  system for all popular mobile device platforms, built on the
diff --git a/package/jquery-sparkline/Config.in b/package/jquery-sparkline/Config.in
index ae66364..d656b45 100644
--- a/package/jquery-sparkline/Config.in
+++ b/package/jquery-sparkline/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_SPARKLINE
 	bool "jQuery-Sparkline"
-	select BR2_PACKAGE_JQUERY
 	help
 	  This jQuery plugin generates sparklines (small inline
 	  charts) directly in the browser using data supplied either
diff --git a/package/jquery-ui/Config.in b/package/jquery-ui/Config.in
index f1653d5..4d755b6 100644
--- a/package/jquery-ui/Config.in
+++ b/package/jquery-ui/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_UI
 	bool "jQuery UI"
-	select BR2_PACKAGE_JQUERY
 	help
 	  jQuery UI provides abstractions for low-level interaction and
 	  animation, advanced effects and high-level, themeable widgets,
diff --git a/package/jquery-validation/Config.in b/package/jquery-validation/Config.in
index ab2ee26..5d85756 100644
--- a/package/jquery-validation/Config.in
+++ b/package/jquery-validation/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JQUERY_VALIDATION
 	bool "jQuery-Validation"
-	select BR2_PACKAGE_JQUERY
 	help
 	  The jQuery Validation Plugin provides drop-in validation for
 	  your existing forms, while making all kinds of
-- 
2.1.4
