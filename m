From: Avi Shukron <avraham.shukron@gmail.com>
Date: Thu, 13 Aug 2020 23:11:22 +0300
Subject: [Buildroot] [PATCH] libbacktrace: new package
Message-ID: <20200813201123.609907-1-avraham.shukron@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libbacktrace is a C library that may be linked into a C/C++ program to
produce symbolic backtraces.

Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
---
 package/Config.in                      |  1 +
 package/libbacktrace/Config.in         |  7 +++++++
 package/libbacktrace/libbacktrace.hash |  3 +++
 package/libbacktrace/libbacktrace.mk   | 16 ++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/libbacktrace/Config.in
 create mode 100644 package/libbacktrace/libbacktrace.hash
 create mode 100644 package/libbacktrace/libbacktrace.mk

diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..cf65919091 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -179,6 +179,7 @@ menu "Development tools"
 	source "package/subversion/Config.in"
 	source "package/tree/Config.in"
 	source "package/yasm/Config.in"
+	source "package/libbacktrace/Config.in"
 endmenu
 
 menu "Filesystem and flash utilities"
diff --git a/package/libbacktrace/Config.in b/package/libbacktrace/Config.in
new file mode 100644
index 0000000000..0f940dd588
--- /dev/null
+++ b/package/libbacktrace/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBBACKTRACE
+	bool "libbacktrace"
+	help
+	  A C library that may be linked into a C/C++ program to
+	  produce symbolic backtraces
+
+	  https://github.com/ianlancetaylor/libbacktrace
diff --git a/package/libbacktrace/libbacktrace.hash b/package/libbacktrace/libbacktrace.hash
new file mode 100644
index 0000000000..9c73990677
--- /dev/null
+++ b/package/libbacktrace/libbacktrace.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  LICENSE
+sha256 13072c499c76866c188beaf3d50f3dddbf2c27ed9fd72b33d1b857acd33b1cb5  9b7f216e867916594d81e8b6118f092ac3fcf704.tar.gz
diff --git a/package/libbacktrace/libbacktrace.mk b/package/libbacktrace/libbacktrace.mk
new file mode 100644
index 0000000000..4179295cea
--- /dev/null
+++ b/package/libbacktrace/libbacktrace.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libbacktrace
+#
+################################################################################
+
+LIBBACKTRACE_VERSION = 9b7f216e867916594d81e8b6118f092ac3fcf704
+LIBBACKTRACE_SITE = https://github.com/ianlancetaylor/libbacktrace/archive
+LIBBACKTRACE_SOURCE = $(LIBBACKTRACE_VERSION).tar.gz
+
+LIBBACKTRACE_LICENSE = BSD
+LIBBACKTRACE_LICENSE_FILES = LICENSE
+
+LIBBACKTRACE_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.25.1
