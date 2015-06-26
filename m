From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 26 Jun 2015 10:19:43 -0400
Subject: [Buildroot] [PATCH 1/1] libucl: new package
Message-ID: <1435328383-24851-1-git-send-email-nimaim@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nimai Mahajan <nimaim@gmail.com>

Libucl is a high performance and flexible JSON/YAML/etc. parser for C.

https://github.com/vstakhov/libucl

Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
---
 package/Config.in          |  1 +
 package/libucl/Config.in   | 16 ++++++++++++++++
 package/libucl/libucl.hash |  2 ++
 package/libucl/libucl.mk   | 14 ++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/libucl/Config.in
 create mode 100644 package/libucl/libucl.hash
 create mode 100644 package/libucl/libucl.mk

diff --git a/package/Config.in b/package/Config.in
index fac632f..9dbc98f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -881,6 +881,7 @@ menu "JSON/XML"
 	source "package/jsoncpp/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
+	source "package/libucl/Config.in"
 	source "package/libxml2/Config.in"
 	source "package/libxmlpp/Config.in"
 	source "package/libxmlrpc/Config.in"
diff --git a/package/libucl/Config.in b/package/libucl/Config.in
new file mode 100644
index 0000000..0775ce0
--- /dev/null
+++ b/package/libucl/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBUCL
+	bool "libucl"
+	help
+	  Universal configuration library parser
+
+	  Libucl is a parser and C API to parse and generate ucl
+	  objects. Libucl consist of several groups of functions:
+	  parser, emitting, conversion, generation, iteration,
+	  validation, and utility. These functions can be used to
+	  work with several formats: JSON, compact JSON, configuration 
+	  (nginx like), and YAML. Libucl has clear design that should 
+	  be very convenient for reading and writing and makes for an
+	  ideal parser with high performance. 
+
+	  https://github.com/vstakhov/libucl
+	  
diff --git a/package/libucl/libucl.hash b/package/libucl/libucl.hash
new file mode 100644
index 0000000..daa2f1e
--- /dev/null
+++ b/package/libucl/libucl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2f69995c7f8320350f56c1183c395cc4a2a958331f22d60b7839a117c9c601e1  libucl-0.7.3.tar.gz
diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
new file mode 100644
index 0000000..638821f
--- /dev/null
+++ b/package/libucl/libucl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libucl
+#
+################################################################################
+
+LIBUCL_VERSION = 0.7.3
+LIBUCL_SITE = $(call github,vstakhov,libucl,$(LIBUCL_VERSION))
+LIBUCL_INSTALL_STAGING = YES
+LIBUCL_AUTORECONF = YES
+LIBUCL_LICENSE = BSD
+LIBUCL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.9.1
