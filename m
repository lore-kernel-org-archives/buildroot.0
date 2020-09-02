From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:35 -0000
Subject: [Buildroot] [git commit] package/libbacktrace: new package
Message-ID: <20200902161634.8BDED85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a30cf5c135f51c0cf6c62699d5f93b3abffa2c65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A C library that may be linked into a C/C++ program to produce
symbolic backtraces.

Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                      |  1 +
 package/libbacktrace/Config.in         |  7 +++++++
 package/libbacktrace/libbacktrace.hash |  3 +++
 package/libbacktrace/libbacktrace.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d8d9b7617f..b5285a66a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1833,6 +1833,7 @@ menu "Other"
 	source "package/libatomic_ops/Config.in"
 	source "package/libavl/Config.in"
 	source "package/libb64/Config.in"
+	source "package/libbacktrace/Config.in"
 	source "package/libbsd/Config.in"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
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
index 0000000000..ecd530a33b
--- /dev/null
+++ b/package/libbacktrace/libbacktrace.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 13072c499c76866c188beaf3d50f3dddbf2c27ed9fd72b33d1b857acd33b1cb5  libbacktrace-9b7f216e867916594d81e8b6118f092ac3fcf704.tar.gz
+sha256 ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  LICENSE
diff --git a/package/libbacktrace/libbacktrace.mk b/package/libbacktrace/libbacktrace.mk
new file mode 100644
index 0000000000..8f812228e3
--- /dev/null
+++ b/package/libbacktrace/libbacktrace.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libbacktrace
+#
+################################################################################
+
+LIBBACKTRACE_VERSION = 9b7f216e867916594d81e8b6118f092ac3fcf704
+LIBBACKTRACE_SITE = $(call github,ianlancetaylor,libbacktrace,$(LIBBACKTRACE_VERSION))
+LIBBACKTRACE_LICENSE = BSD-3C-like
+LIBBACKTRACE_LICENSE_FILES = LICENSE
+LIBBACKTRACE_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
