From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:43 +0100
Subject: [Buildroot] [PATCH 14/84 RFC] package/jquery: include external
	plugins from jquery's Config.in
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <805bddfa16ccc143f1c0a871d7304af0f2b155c7.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and make it a menuconfig instead of a 'config'+'menu'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in        | 12 ------------
 package/jquery/Config.in | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dd44743..73a3ac8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -951,18 +951,6 @@ menu "Javascript"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
-if BR2_PACKAGE_JQUERY
-menu "External jQuery plugins"
-	source "package/jquery-datetimepicker/Config.in"
-	source "package/jquery-keyboard/Config.in"
-	source "package/jquery-mobile/Config.in"
-	source "package/jquery-sidebar/Config.in"
-	source "package/jquery-sparkline/Config.in"
-	source "package/jquery-ui/Config.in"
-	source "package/jquery-ui-themes/Config.in"
-	source "package/jquery-validation/Config.in"
-endmenu
-endif
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
 endmenu
diff --git a/package/jquery/Config.in b/package/jquery/Config.in
index 92f5604..3133702 100644
--- a/package/jquery/Config.in
+++ b/package/jquery/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_JQUERY
+menuconfig BR2_PACKAGE_JQUERY
 	bool "jQuery"
 	help
 	  jQuery is a fast and concise JavaScript Library that
@@ -6,3 +6,18 @@ config BR2_PACKAGE_JQUERY
 	  animating, and Ajax interactions for rapid web development.
 
 	  http://jquery.com
+
+if BR2_PACKAGE_JQUERY
+
+comment "External jQuery plugins"
+
+source "package/jquery-datetimepicker/Config.in"
+source "package/jquery-keyboard/Config.in"
+source "package/jquery-mobile/Config.in"
+source "package/jquery-sidebar/Config.in"
+source "package/jquery-sparkline/Config.in"
+source "package/jquery-ui/Config.in"
+source "package/jquery-ui-themes/Config.in"
+source "package/jquery-validation/Config.in"
+
+endif
-- 
1.9.1
