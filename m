From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:00 +0100
Subject: [Buildroot] [PATCH 08/80 v1] package/jquery: include external
	plugins from jquery's Config.in
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <837acfb60a337e2f6b1c6e279185e8c95878a4e9.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and make it a menuconfig instead of a 'config'+'menu'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in        | 12 ------------
 package/jquery/Config.in | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 89b23db..48e0c7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -962,18 +962,6 @@ menu "Javascript"
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
