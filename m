From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Dec 2012 23:16:14 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-ng: update config fro
	glibc-based toolchains
Message-ID: <1356041774-10868-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the version of glibc to be used, since older versions are
broken with the currently-used binutils versions.

Fixes build issues ending with:
    tmpfs/ccvkz3ro.s:33: Error: CFI instruction used without
    previous .cfi_startproc

This new version does not have RPC support, so update the Config.in.

CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-crosstool-ng/Config.in         |    5 ++---
 .../crosstool-ng.config-glibc                      |    6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 9cd5ca5..d80f547 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -24,9 +24,8 @@ config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	# Our default ct-ng configuration uses glibc 2.9, which has
-	# native RPC support
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# Our default ct-ng configuration uses glibc 2.14.1, which
+	# does not have native RPC support
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index ae0bc02..5b4bbba 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -356,13 +356,13 @@ CT_CC_GCC_LDBL_128=m
 # C-library
 #
 CT_LIBC="glibc"
-CT_LIBC_VERSION="2.9"
+CT_LIBC_VERSION="2.14.1"
 # CT_LIBC_eglibc is not set
 CT_LIBC_glibc=y
 # CT_LIBC_uClibc is not set
 CT_LIBC_eglibc_AVAILABLE=y
 CT_LIBC_glibc_AVAILABLE=y
-# CT_LIBC_GLIBC_V_2_14_1 is not set
+CT_LIBC_GLIBC_V_2_14_1
 # CT_LIBC_GLIBC_V_2_14 is not set
 # CT_LIBC_GLIBC_V_2_13 is not set
 # CT_LIBC_GLIBC_V_2_12_2 is not set
@@ -370,7 +370,7 @@ CT_LIBC_glibc_AVAILABLE=y
 # CT_LIBC_GLIBC_V_2_11_1 is not set
 # CT_LIBC_GLIBC_V_2_11 is not set
 # CT_LIBC_GLIBC_V_2_10_1 is not set
-CT_LIBC_GLIBC_V_2_9=y
+# CT_LIBC_GLIBC_V_2_9 is not set
 # CT_LIBC_GLIBC_V_2_8 is not set
 CT_LIBC_mingw_AVAILABLE=y
 CT_LIBC_newlib_AVAILABLE=y
-- 
1.7.2.5
