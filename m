From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:39 +0200
Subject: [Buildroot] [PATCH 16/18] package/Config.in: fix menus ordering
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-16-jerzy.m.grzegorek@gmail.com>
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
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in | 70 +++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7bc97fff72..a1072990ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1424,6 +1424,41 @@ menu "Hardware handling"
 	source "package/wiringpi/Config.in"
 endmenu
 
+menu "JSON/XML"
+        source "package/benejson/Config.in"
+        source "package/cjson/Config.in"
+        source "package/expat/Config.in"
+        source "package/ezxml/Config.in"
+        source "package/jansson/Config.in"
+        source "package/jose/Config.in"
+        source "package/jsmn/Config.in"
+        source "package/json-c/Config.in"
+        source "package/json-for-modern-cpp/Config.in"
+        source "package/json-glib/Config.in"
+        source "package/jsoncpp/Config.in"
+        source "package/libbson/Config.in"
+        source "package/libfastjson/Config.in"
+        source "package/libjson/Config.in"
+        source "package/libroxml/Config.in"
+        source "package/libucl/Config.in"
+        source "package/libxml2/Config.in"
+        source "package/libxmlpp/Config.in"
+        source "package/libxmlrpc/Config.in"
+        source "package/libxslt/Config.in"
+        source "package/libyaml/Config.in"
+        source "package/mxml/Config.in"
+        source "package/pugixml/Config.in"
+        source "package/rapidjson/Config.in"
+        source "package/rapidxml/Config.in"
+        source "package/raptor/Config.in"
+        source "package/tinyxml/Config.in"
+        source "package/tinyxml2/Config.in"
+        source "package/valijson/Config.in"
+        source "package/xerces/Config.in"
+        source "package/yajl/Config.in"
+        source "package/yaml-cpp/Config.in"
+endmenu
+
 menu "Javascript"
 	source "package/angularjs/Config.in"
 if BR2_PACKAGE_ANGULARJS
@@ -1452,41 +1487,6 @@ endif
 	source "package/json-javascript/Config.in"
 endmenu
 
-menu "JSON/XML"
-	source "package/benejson/Config.in"
-	source "package/cjson/Config.in"
-	source "package/expat/Config.in"
-	source "package/ezxml/Config.in"
-	source "package/jansson/Config.in"
-	source "package/jose/Config.in"
-	source "package/jsmn/Config.in"
-	source "package/json-c/Config.in"
-	source "package/json-for-modern-cpp/Config.in"
-	source "package/json-glib/Config.in"
-	source "package/jsoncpp/Config.in"
-	source "package/libbson/Config.in"
-	source "package/libfastjson/Config.in"
-	source "package/libjson/Config.in"
-	source "package/libroxml/Config.in"
-	source "package/libucl/Config.in"
-	source "package/libxml2/Config.in"
-	source "package/libxmlpp/Config.in"
-	source "package/libxmlrpc/Config.in"
-	source "package/libxslt/Config.in"
-	source "package/libyaml/Config.in"
-	source "package/mxml/Config.in"
-	source "package/pugixml/Config.in"
-	source "package/rapidjson/Config.in"
-	source "package/rapidxml/Config.in"
-	source "package/raptor/Config.in"
-	source "package/tinyxml/Config.in"
-	source "package/tinyxml2/Config.in"
-	source "package/valijson/Config.in"
-	source "package/xerces/Config.in"
-	source "package/yajl/Config.in"
-	source "package/yaml-cpp/Config.in"
-endmenu
-
 menu "Logging"
 	source "package/eventlog/Config.in"
 	source "package/glog/Config.in"
-- 
2.17.1
