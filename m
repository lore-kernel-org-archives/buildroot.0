From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 21 Jul 2014 16:12:17 +0200
Subject: [Buildroot] [RFC 3/3] Rename package mpfr to libmpfr
In-Reply-To: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
Message-ID: <1405951937-21226-4-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/Config.in                   |  2 +-
 package/{mpfr => libmpfr}/Config.in |  4 ++--
 package/libmpfr/libmpfr.mk          | 17 +++++++++++++++++
 package/mpfr/mpfr.mk                | 17 -----------------
 package/sconeserver/Config.in       |  2 +-
 5 files changed, 21 insertions(+), 21 deletions(-)
 rename package/{mpfr => libmpfr}/Config.in (80%)
 create mode 100644 package/libmpfr/libmpfr.mk
 delete mode 100644 package/mpfr/mpfr.mk

diff --git a/package/Config.in b/package/Config.in
index d0feeee..b81c481 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -839,6 +839,7 @@ menu "Other"
 	source "package/libgmp/Config.in"
 	source "package/libical/Config.in"
 	source "package/libmpc/Config.in"
+	source "package/libmpfr/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplist/Config.in"
@@ -856,7 +857,6 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/linux-pam/Config.in"
 	source "package/lttng-libust/Config.in"
-	source "package/mpfr/Config.in"
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/orc/Config.in"
diff --git a/package/mpfr/Config.in b/package/libmpfr/Config.in
similarity index 80%
rename from package/mpfr/Config.in
rename to package/libmpfr/Config.in
index e2f19cc8..56b19da 100644
--- a/package/mpfr/Config.in
+++ b/package/libmpfr/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_MPFR
-	bool "mpfr"
+config BR2_PACKAGE_LIBMPFR
+	bool "libmpfr"
 	default y if BR2_INSTALL_FORTRAN
 	select BR2_PACKAGE_LIBGMP
 	help
diff --git a/package/libmpfr/libmpfr.mk b/package/libmpfr/libmpfr.mk
new file mode 100644
index 0000000..da65875
--- /dev/null
+++ b/package/libmpfr/libmpfr.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libmpfr
+#
+################################################################################
+
+LIBMPFR_VERSION = 3.1.2
+LIBMPFR_SITE = http://www.mpfr.org/mpfr-$(LIBMPFR_VERSION)
+LIBMPFR_SOURCE = mpfr-$(LIBMPFR_VERSION).tar.xz
+LIBMPFR_LICENSE = LGPLv3+
+LIBMPFR_LICENSE_FILES = COPYING.LESSER
+LIBMPFR_INSTALL_STAGING = YES
+LIBMPFR_DEPENDENCIES = gmp
+LIBMPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
deleted file mode 100644
index 52d88fe..0000000
--- a/package/mpfr/mpfr.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# mpfr
-#
-################################################################################
-
-MPFR_VERSION = 3.1.2
-MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
-MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
-MPFR_LICENSE = LGPLv3+
-MPFR_LICENSE_FILES = COPYING.LESSER
-MPFR_INSTALL_STAGING = YES
-MPFR_DEPENDENCIES = gmp
-MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 6999535..2f435b9 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -79,7 +79,7 @@ config BR2_PACKAGE_SCONESERVER_LETTUCE
 
 config BR2_PACKAGE_SCONESERVER_MATHS
 	bool "maths"
-	select BR2_PACKAGE_MPFR
+	select BR2_PACKAGE_LIBMPFR
 	help
 	  Mathematics module for Sconeserver
 
-- 
2.0.2
