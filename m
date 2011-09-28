From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Sep 2011 22:18:29 +0200
Subject: [Buildroot] [git commit] package: add json-c library
Message-ID: <20110928213516.C6A358D9CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fc42cda363292b05d16d8eabaceba6376edc318
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

json-c is a JSON library written in C.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/json-c/Config.in |   11 +++++++++++
 package/json-c/json-c.mk |   11 +++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3d04056..a849266 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ endmenu
 menu "JSON/XML"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
+source "package/json-c/Config.in"
 source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
diff --git a/package/json-c/Config.in b/package/json-c/Config.in
new file mode 100644
index 0000000..dbdd75b
--- /dev/null
+++ b/package/json-c/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_JSON_C
+	bool "json-c"
+	help
+	  JSON-C - A JSON implementation in C
+
+	  JSON-C implements a reference counting object model that
+	  allows you to easily construct JSON objects in C, output
+	  them as JSON formatted strings and parse JSON formatted
+	  strings back into the C representation of JSON objects.
+
+	  http://oss.metaparadigm.com/json-c/
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
new file mode 100644
index 0000000..295c55e
--- /dev/null
+++ b/package/json-c/json-c.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# json-c
+#
+################################################################################
+
+JSON_C_VERSION = 0.9
+JSON_C_SITE = http://oss.metaparadigm.com/json-c/
+JSON_C_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,json-c))
