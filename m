From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:25 +0200
Subject: [Buildroot] [PATCH v2 11/13] package/Config.in: fix menus ordering
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-12-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
package/Config.in:1455: Menus in: menu "Libraries",
                        are not alphabetically ordered;
                        correct order: '-', '_', digits, capitals, lowercase;
                        first incorrect menu: JSON/XML

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/Config.in | 56 +++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d540ac00bf..ca381ffdb6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1438,34 +1438,6 @@ menu "Hardware handling"
 	source "package/wiringpi/Config.in"
 endmenu
 
-menu "Javascript"
-	source "package/angularjs/Config.in"
-if BR2_PACKAGE_ANGULARJS
-menu "External AngularJS plugins"
-	source "package/angular-websocket/Config.in"
-endmenu
-endif
-	source "package/bootstrap/Config.in"
-	source "package/duktape/Config.in"
-	source "package/explorercanvas/Config.in"
-	source "package/flot/Config.in"
-	source "package/jquery/Config.in"
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
-	source "package/jsmin/Config.in"
-	source "package/json-javascript/Config.in"
-endmenu
-
 menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
@@ -1501,6 +1473,34 @@ menu "JSON/XML"
 	source "package/yaml-cpp/Config.in"
 endmenu
 
+menu "Javascript"
+	source "package/angularjs/Config.in"
+if BR2_PACKAGE_ANGULARJS
+menu "External AngularJS plugins"
+	source "package/angular-websocket/Config.in"
+endmenu
+endif
+	source "package/bootstrap/Config.in"
+	source "package/duktape/Config.in"
+	source "package/explorercanvas/Config.in"
+	source "package/flot/Config.in"
+	source "package/jquery/Config.in"
+if BR2_PACKAGE_JQUERY
+menu "External jQuery plugins"
+	source "package/jquery-datetimepicker/Config.in"
+	source "package/jquery-keyboard/Config.in"
+	source "package/jquery-mobile/Config.in"
+	source "package/jquery-sidebar/Config.in"
+	source "package/jquery-sparkline/Config.in"
+	source "package/jquery-ui/Config.in"
+	source "package/jquery-ui-themes/Config.in"
+	source "package/jquery-validation/Config.in"
+endmenu
+endif
+	source "package/jsmin/Config.in"
+	source "package/json-javascript/Config.in"
+endmenu
+
 menu "Logging"
 	source "package/glog/Config.in"
 	source "package/liblog4c-localtime/Config.in"
-- 
2.17.1
