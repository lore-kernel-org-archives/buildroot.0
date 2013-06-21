From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 21 Jun 2013 23:03:10 +0000
Subject: [Buildroot] [PATCH] libunwind:  new package
Message-ID: <F9C551623D2CBB4C9488801D14F864C639A6A708@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/Config.in b/package/Config.in
--- a/package/Config.in 2013-06-20 10:32:07.000000000 -0500
+++ b/package/Config.in 2013-06-21 17:00:21.000000000 -0500
@@ -612,6 +612,7 @@
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libseccomp/Config.in"
+source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
 source "package/log4cxx/Config.in"
diff -Naur a/package/libunwind/Config.in b/package/libunwind/Config.in
--- a/package/libunwind/Config.in       1969-12-31 18:00:00.000000000 -0600
+++ b/package/libunwind/Config.in       2013-06-21 17:23:46.000000000 -0500
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBUNWIND
+	bool "libunwind"
+	help
+	  C API to determine the call-chain of a program.
+
+	  Project home:  <http://www.nongnu.org/libunwind/index.html>
diff -Naur a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
--- a/package/libunwind/libunwind.mk    1969-12-31 18:00:00.000000000 -0600
+++ b/package/libunwind/libunwind.mk    2013-06-21 17:23:38.000000000 -0500
@@ -0,0 +1,12 @@
+################################################################################
+#
+# libuwind
+#
+################################################################################
+
+LIBUNWIND_VERSION = 1.1
+LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
+LIBUNWIND_INSTALL_STAGING = YES
+LIBUNWIND_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
