From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 21 Jul 2014 17:37:23 +0200
Subject: [Buildroot] [RFC v2 2/3] Rename package gmp to libgmp
In-Reply-To: <1405957044-11649-1-git-send-email-jkrause@posteo.de>
References: <1405957044-11649-1-git-send-email-jkrause@posteo.de>
Message-ID: <1405957044-11649-3-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/Config.in                                        |  2 +-
 package/dnsmasq/Config.in                                |  2 +-
 package/gmp/gmp.mk                                       | 16 ----------------
 package/{gmp => libgmp}/Config.in                        |  4 ++--
 .../libgmp-01-arm-asm-conditional-on-no-thumb-1.patch}   |  0
 .../libgmp-02-arm-asm-conditional-on-no-thumb-2.patch}   |  0
 ...owerpc-provide-default-bmod-to-mod-threshold-1.patch} |  0
 package/libgmp/libgmp.mk                                 | 16 ++++++++++++++++
 package/libmpc/Config.in                                 |  2 +-
 package/mpfr/Config.in                                   |  2 +-
 package/nettle/Config.in                                 |  2 +-
 package/nftables/Config.in                               |  2 +-
 package/openswan/Config.in                               |  2 +-
 package/python-pycrypto/Config.in                        |  2 +-
 package/strongswan/Config.in                             |  2 +-
 15 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 package/gmp/gmp.mk
 rename package/{gmp => libgmp}/Config.in (64%)
 rename package/{gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch => libgmp/libgmp-01-arm-asm-conditional-on-no-thumb-1.patch} (100%)
 rename package/{gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch => libgmp/libgmp-02-arm-asm-conditional-on-no-thumb-2.patch} (100%)
 rename package/{gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch => libgmp/libgmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch} (100%)
 create mode 100644 package/libgmp/libgmp.mk

diff --git a/package/Config.in b/package/Config.in
index 9370d7c..d0feeee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -818,7 +818,6 @@ menu "Other"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/glibmm/Config.in"
-	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/libargtable2/Config.in"
@@ -837,6 +836,7 @@ menu "Other"
 	source "package/libffi/Config.in"
 	source "package/libgc/Config.in"
 	source "package/libglib2/Config.in"
+	source "package/libgmp/Config.in"
 	source "package/libical/Config.in"
 	source "package/libmpc/Config.in"
 	source "package/libnspr/Config.in"
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 40376ad..7998fca 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_DNSMASQ_DHCP
 
 config BR2_PACKAGE_DNSMASQ_DNSSEC
 	bool "DNSSEC support"
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	select BR2_PACKAGE_NETTLE
 	help
 	  Enable DNSSEC validation and caching support.
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
deleted file mode 100644
index f71a210..0000000
--- a/package/gmp/gmp.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# gmp
-#
-################################################################################
-
-GMP_VERSION = 6.0.0a
-GMP_SITE = $(BR2_GNU_MIRROR)/gmp
-GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
-GMP_INSTALL_STAGING = YES
-GMP_LICENSE = LGPLv3+
-GMP_LICENSE_FILES = COPYING.LESSERv3
-GMP_DEPENDENCIES = host-m4
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/gmp/Config.in b/package/libgmp/Config.in
similarity index 64%
rename from package/gmp/Config.in
rename to package/libgmp/Config.in
index 226e088..a2519c5 100644
--- a/package/gmp/Config.in
+++ b/package/libgmp/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_GMP
-	bool "gmp"
+config BR2_PACKAGE_LIBGMP
+	bool "libgmp"
 	help
 	  GNU Multiple Precision Arithmetic Library.
 
diff --git a/package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch b/package/libgmp/libgmp-01-arm-asm-conditional-on-no-thumb-1.patch
similarity index 100%
rename from package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch
rename to package/libgmp/libgmp-01-arm-asm-conditional-on-no-thumb-1.patch
diff --git a/package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch b/package/libgmp/libgmp-02-arm-asm-conditional-on-no-thumb-2.patch
similarity index 100%
rename from package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch
rename to package/libgmp/libgmp-02-arm-asm-conditional-on-no-thumb-2.patch
diff --git a/package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch b/package/libgmp/libgmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch
similarity index 100%
rename from package/gmp/gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch
rename to package/libgmp/libgmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch
diff --git a/package/libgmp/libgmp.mk b/package/libgmp/libgmp.mk
new file mode 100644
index 0000000..cd61eec
--- /dev/null
+++ b/package/libgmp/libgmp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libgmp
+#
+################################################################################
+
+LIBGMP_VERSION = 6.0.0a
+LIBGMP_SITE = $(BR2_GNU_MIRROR)/gmp
+LIBGMP_SOURCE = gmp-$(LIBGMP_VERSION).tar.xz
+LIBGMP_INSTALL_STAGING = YES
+LIBGMP_LICENSE = LGPLv3+
+LIBGMP_LICENSE_FILES = COPYING.LESSERv3
+LIBGMP_DEPENDENCIES = host-m4
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libmpc/Config.in b/package/libmpc/Config.in
index e4b5e01..c000a0c 100644
--- a/package/libmpc/Config.in
+++ b/package/libmpc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBMPC
 	bool "libmpc"
 	select BR2_PACKAGE_MPFR
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	help
 	  Mpc is a C library for the arithmetic of complex numbers with
 	  arbitrarily high precision and correct rounding of the result.
diff --git a/package/mpfr/Config.in b/package/mpfr/Config.in
index 9acb0b4..e2f19cc8 100644
--- a/package/mpfr/Config.in
+++ b/package/mpfr/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MPFR
 	bool "mpfr"
 	default y if BR2_INSTALL_FORTRAN
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	help
 	  C library for multiple-precision floating-point computations
 	  with exact rounding.
diff --git a/package/nettle/Config.in b/package/nettle/Config.in
index 5577621..2318993 100644
--- a/package/nettle/Config.in
+++ b/package/nettle/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NETTLE
 	bool "nettle"
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	help
 	  Nettle is a cryptographic library that is designed to fit easily
 	  in more or less any context: In crypto toolkits for object-oriented
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 4ddfdbd..3730951 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NFTABLES
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
 	select BR2_PACKAGE_READLINE
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 932a75f..8d96666 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	select BR2_PACKAGE_IPROUTE2
 	help
 	  Openswan is an implementation of IPsec for Linux
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
index fe545b5..163b7dc 100644
--- a/package/python-pycrypto/Config.in
+++ b/package/python-pycrypto/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	help
 	  PyCrypto is a collection of cryptographic algorithms and
 	  protocols, implemented for use from Python.
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index d2cadf3..76ce0bd 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -39,7 +39,7 @@ config BR2_PACKAGE_STRONGSWAN_GCRYPT
 
 config BR2_PACKAGE_STRONGSWAN_GMP
 	bool "GNU MP (libgmp)"
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 
 endchoice
 
-- 
2.0.2
