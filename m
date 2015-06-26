From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:21:53 +0200
Subject: [Buildroot] [git commit] libucl: new package
Message-ID: <20150626183301.2980B81814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da27b28838b287c263f3c7818195bc62f22967da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libucl is a high performance and flexible JSON/YAML/etc. parser for C.

https://github.com/vstakhov/libucl

[Thomas:
  - remove hash file, should not be used for github downloads
  - rewrap Config.in help text
  - remove trailing white space in Config.in.
  - add missing host-pkgconf dependency, without which the package
    doesn't autoreconf properly.
  - fix license: it is BSD-2c, not just BSD.]

Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/libucl/Config.in |   15 +++++++++++++++
 package/libucl/libucl.mk |   15 +++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

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
index 0000000..a94701e
--- /dev/null
+++ b/package/libucl/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBUCL
+	bool "libucl"
+	help
+	  Universal configuration library parser
+
+	  Libucl is a parser and C API to parse and generate ucl
+	  objects. Libucl consist of several groups of functions:
+	  parser, emitting, conversion, generation, iteration,
+	  validation, and utility. These functions can be used to work
+	  with several formats: JSON, compact JSON, configuration
+	  (nginx like), and YAML. Libucl has clear design that should
+	  be very convenient for reading and writing and makes for an
+	  ideal parser with high performance.
+
+	  https://github.com/vstakhov/libucl
diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
new file mode 100644
index 0000000..3530bbe
--- /dev/null
+++ b/package/libucl/libucl.mk
@@ -0,0 +1,15 @@
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
+LIBUCL_LICENSE = BSD-2c
+LIBUCL_LICENSE_FILES = COPYING
+LIBUCL_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
