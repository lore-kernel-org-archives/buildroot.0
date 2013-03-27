From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 27 Mar 2013 10:33:57 +0000
Subject: [Buildroot] [PATCH] jansson: new package
Message-ID: <1364380437-28214-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in          |    1 +
 package/jansson/Config.in  |    7 +++++++
 package/jansson/jansson.mk |   12 ++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/jansson/Config.in
 create mode 100644 package/jansson/jansson.mk

diff --git a/package/Config.in b/package/Config.in
index 5d8f4f6..35a6c5a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -602,6 +602,7 @@ menu "JSON/XML"
 source "package/cjson/Config.in"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
+source "package/jansson/Config.in"
 source "package/json-c/Config.in"
 source "package/json-glib/Config.in"
 source "package/libroxml/Config.in"
diff --git a/package/jansson/Config.in b/package/jansson/Config.in
new file mode 100644
index 0000000..960a7c4
--- /dev/null
+++ b/package/jansson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JANSSON
+	bool "jansson"
+	help
+	  Jansson is a C library for encoding, decoding and manipulating JSON
+	  data.
+
+	  http://www.digip.org/jansson/
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
new file mode 100644
index 0000000..c7183df
--- /dev/null
+++ b/package/jansson/jansson.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# jansson
+#
+#############################################################
+JANSSON_VERSION = 2.4
+JANSSON_SITE = http://www.digip.org/jansson/releases
+JANSSON_LICENSE = MIT
+JANSSON_LICENSE_FILES = LICENSE
+JANSSON_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
