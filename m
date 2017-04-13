From: Semyon Kolganov <semenak94@mail.ru>
Date: Thu, 13 Apr 2017 23:32:01 +0300
Subject: [Buildroot] [PATCHv2] mpir: new package
In-Reply-To: <mpir: new package>
References: <mpir: new package>
Message-ID: <1492115521-3293-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
Changes between v1 and v2:
 - removed host variant
 - added package to DEVELOPERS
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/mpir/Config.in |  8 ++++++++
 package/mpir/mpir.hash |  2 ++
 package/mpir/mpir.mk   | 16 ++++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/mpir/Config.in
 create mode 100644 package/mpir/mpir.hash
 create mode 100644 package/mpir/mpir.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a7e1849..1f42e6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1418,6 +1418,7 @@ F:	package/yaml-cpp/
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
 F:	package/libbson/
+F:	package/mpir/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
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
index 0000000..9b15a0c
--- /dev/null
+++ b/package/mpir/mpir.mk
@@ -0,0 +1,16 @@
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
+MPIR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)
+
+$(eval $(autotools-package))
-- 
2.7.4
