From: Semyon Kolganov <semenak94@mail.ru>
Date: Thu, 13 Apr 2017 16:49:34 +0300
Subject: [Buildroot] [PATCH] mpir: new package
In-Reply-To: <mpir: new package>
References: <mpir: new package>
Message-ID: <1492091374-5028-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
 package/Config.in      |  1 +
 package/mpir/Config.in |  8 ++++++++
 package/mpir/mpir.hash |  2 ++
 package/mpir/mpir.mk   | 18 ++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/mpir/Config.in
 create mode 100644 package/mpir/mpir.hash
 create mode 100644 package/mpir/mpir.mk

diff --git a/package/Config.in b/package/Config.in
index 3683578..0866c13 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1405,6 +1405,7 @@ endif
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
+	source "package/mpir/Config.in"
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/musl-compat-headers/Config.in"
diff --git a/package/mpir/Config.in b/package/mpir/Config.in
new file mode 100644
index 0000000..acd448c
--- /dev/null
+++ b/package/mpir/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MPIR
+	bool "mpir"
+	select BR2_PACKAGE_GMP
+	help
+	  MPIR is a highly optimised library for bignum arithmetic forked 
+	  from the GMP bignum library.
+
+	  http://www.mpir.org/
diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
new file mode 100644
index 0000000..8320337
--- /dev/null
+++ b/package/mpir/mpir.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb	mpir-3.0.0.tar.bz2
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
new file mode 100644
index 0000000..fbce887
--- /dev/null
+++ b/package/mpir/mpir.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# mpir
+#
+################################################################################
+
+MPIR_VERSION = 3.0.0
+MPIR_SITE = http://www.mpir.org
+MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
+MPIR_LICENSE = LGPL-3.0+
+MPIR_LICENSE_FILES = COPYING.LIB
+MPIR_INSTALL_STAGING = YES
+MPIR_DEPENDENCIES = gmp
+HOST_MPIR_DEPENDENCIES = host-gmp
+MPIR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
