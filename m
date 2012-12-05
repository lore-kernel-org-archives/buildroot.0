From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 07:27:19 -0800
Subject: [Buildroot] [git commit] package/crosstool-ng: update to 1.17.0
Message-ID: <20121205164221.1F93D9967B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b855154ee8683e87afa08c6cc50b716d22879922
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updating current crosstool-ng config files to 1.17.0
 crosstool-ng.config-eglibc
 crosstool-ng.config-glibc
 crosstool-ng.config-uClibc

Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 .../crosstool-ng.config-eglibc                     |   73 +++++++++++++++-----
 .../crosstool-ng.config-glibc                      |   74 +++++++++++++++-----
 .../crosstool-ng.config-uClibc                     |   71 ++++++++++++++-----
 4 files changed, 165 insertions(+), 55 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 5bc65e1..3b207a2 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.16.0
+CROSSTOOL_NG_VERSION           = 1.17.0
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_TARGET    = NO
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 6c55921..1b523ec 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,12 +1,10 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.16.0 Configuration
-# Sun Aug  5 20:02:42 2012
+# crosstool-NG 1.17.0 Configuration
+# Mon Dec  3 20:10:26 2012
 #
 CT_CONFIGURE_has_xz=y
-CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
-CT_BACKEND=y
 CT_MODULES=y
 
 #
@@ -18,15 +16,16 @@ CT_MODULES=y
 #
 # CT_OBSOLETE is not set
 # CT_EXPERIMENTAL is not set
+# CT_DEBUG_CT is not set
 
 #
 # Paths
 #
 CT_LOCAL_TARBALLS_DIR=""
-CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
 CT_PREFIX_DIR=""
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
+CT_RM_RF_PREFIX_DIR=y
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
 # CT_STRIP_ALL_TOOLCHAIN_EXECUTABLES is not set
@@ -58,16 +57,15 @@ CT_PATCH_ORDER="bundled"
 #
 # Build behavior
 #
-
-#
-# Build options hiden
-#
 CT_PARALLEL_JOBS=0
 CT_LOAD=0
 CT_USE_PIPES=y
 CT_EXTRA_FLAGS_FOR_HOST=""
-CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
-CT_CONFIG_SHELL="/bin/sh"
+# CT_CONFIG_SHELL_SH is not set
+# CT_CONFIG_SHELL_ASH is not set
+CT_CONFIG_SHELL_BASH=y
+# CT_CONFIG_SHELL_CUSTOM is not set
+CT_CONFIG_SHELL="${bash}"
 
 #
 # Logging
@@ -111,8 +109,27 @@ CT_ARCH_BITNESS=32
 CT_ARCH_FLOAT_SW=y
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
+# CT_ARCH_alpha is not set
 CT_ARCH_arm=y
+# CT_ARCH_avr32 is not set
+# CT_ARCH_blackfin is not set
+# CT_ARCH_mips is not set
+# CT_ARCH_powerpc is not set
+# CT_ARCH_sh is not set
+# CT_ARCH_sparc is not set
+# CT_ARCH_x86 is not set
+CT_ARCH_alpha_AVAILABLE=y
 CT_ARCH_arm_AVAILABLE=y
+CT_ARCH_avr32_AVAILABLE=y
+CT_ARCH_blackfin_AVAILABLE=y
+CT_ARCH_m68k_AVAILABLE=y
+CT_ARCH_microblaze_AVAILABLE=y
+CT_ARCH_mips_AVAILABLE=y
+CT_ARCH_powerpc_AVAILABLE=y
+CT_ARCH_s390_AVAILABLE=y
+CT_ARCH_sh_AVAILABLE=y
+CT_ARCH_sparc_AVAILABLE=y
+CT_ARCH_x86_AVAILABLE=y
 
 #
 # Generic target options
@@ -178,24 +195,31 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.5"
+CT_KERNEL_VERSION="3.6.3"
+# CT_KERNEL_bare_metal is not set
 CT_KERNEL_linux=y
+CT_KERNEL_bare_metal_AVAILABLE=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_5=y
-# CT_KERNEL_V_3_4_7 is not set
+CT_KERNEL_V_3_6_3=y
+# CT_KERNEL_V_3_6_2 is not set
+# CT_KERNEL_V_3_6_1 is not set
+# CT_KERNEL_V_3_6 is not set
+# CT_KERNEL_V_3_5_7 is not set
+# CT_KERNEL_V_3_4_15 is not set
 # CT_KERNEL_V_3_3_8 is not set
-# CT_KERNEL_V_3_2_25 is not set
+# CT_KERNEL_V_3_2_32 is not set
 # CT_KERNEL_V_3_1_10 is not set
-# CT_KERNEL_V_3_0_39 is not set
+# CT_KERNEL_V_3_0_48 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
 # CT_KERNEL_V_2_6_33_20 is not set
-# CT_KERNEL_V_2_6_32_59 is not set
+# CT_KERNEL_V_2_6_32_60 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_62 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
+CT_KERNEL_mingw32_AVAILABLE=y
 
 #
 # Common kernel options
@@ -235,6 +259,7 @@ CT_BINUTILS_LINKER_LD=y
 CT_BINUTILS_LINKERS_LIST="ld"
 CT_BINUTILS_LINKER_DEFAULT="bfd"
 CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
+# CT_BINUTILS_FOR_TARGET is not set
 
 #
 # C compiler
@@ -242,6 +267,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
+# CT_CC_V_4_7_2 is not set
 # CT_CC_V_4_6_3 is not set
 # CT_CC_V_4_6_2 is not set
 # CT_CC_V_4_6_1 is not set
@@ -323,6 +349,8 @@ CT_CC_GCC_LDBL_128=m
 CT_LIBC="eglibc"
 CT_LIBC_VERSION="2_12"
 CT_LIBC_eglibc=y
+# CT_LIBC_glibc is not set
+# CT_LIBC_uClibc is not set
 CT_LIBC_eglibc_AVAILABLE=y
 # CT_LIBC_EGLIBC_V_2_16 is not set
 # CT_LIBC_EGLIBC_V_2_15 is not set
@@ -343,6 +371,11 @@ CT_EGLIBC_REVISION="HEAD"
 # CT_EGLIBC_CHECKOUT is not set
 CT_EGLIBC_OPT_SIZE=y
 # CT_EGLIBC_CUSTOM_CONFIG is not set
+CT_LIBC_glibc_AVAILABLE=y
+CT_LIBC_mingw_AVAILABLE=y
+CT_LIBC_newlib_AVAILABLE=y
+CT_LIBC_none_AVAILABLE=y
+CT_LIBC_uClibc_AVAILABLE=y
 CT_LIBC_SUPPORT_THREADS_ANY=y
 CT_LIBC_SUPPORT_NPTL=y
 CT_LIBC_SUPPORT_LINUXTHREADS=y
@@ -393,12 +426,16 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="3.5"
+CT_LIBC_GLIBC_MIN_KERNEL="3.6.3"
 
 #
 # Debug facilities
 #
+# CT_DEBUG_dmalloc is not set
+# CT_DEBUG_duma is not set
 # CT_DEBUG_gdb is not set
+# CT_DEBUG_ltrace is not set
+# CT_DEBUG_strace is not set
 
 #
 # Companion libraries
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 3910bdb..026c7fd 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,12 +1,10 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.16.0 Configuration
-# Sun Aug  5 21:39:12 2012
+# crosstool-NG 1.17.0 Configuration
+# Mon Dec  3 20:16:52 2012
 #
 CT_CONFIGURE_has_xz=y
-CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
-CT_BACKEND=y
 CT_MODULES=y
 
 #
@@ -18,15 +16,16 @@ CT_MODULES=y
 #
 # CT_OBSOLETE is not set
 # CT_EXPERIMENTAL is not set
+# CT_DEBUG_CT is not set
 
 #
 # Paths
 #
 CT_LOCAL_TARBALLS_DIR=""
-CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
 CT_PREFIX_DIR=""
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
+CT_RM_RF_PREFIX_DIR=y
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
 # CT_STRIP_ALL_TOOLCHAIN_EXECUTABLES is not set
@@ -58,16 +57,15 @@ CT_PATCH_ORDER="bundled"
 #
 # Build behavior
 #
-
-#
-# Build options hiden
-#
 CT_PARALLEL_JOBS=0
 CT_LOAD=0
 CT_USE_PIPES=y
 CT_EXTRA_FLAGS_FOR_HOST=""
-CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
-CT_CONFIG_SHELL="/bin/sh"
+# CT_CONFIG_SHELL_SH is not set
+# CT_CONFIG_SHELL_ASH is not set
+CT_CONFIG_SHELL_BASH=y
+# CT_CONFIG_SHELL_CUSTOM is not set
+CT_CONFIG_SHELL="${bash}"
 
 #
 # Logging
@@ -111,8 +109,27 @@ CT_ARCH_BITNESS=32
 CT_ARCH_FLOAT_SW=y
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
+# CT_ARCH_alpha is not set
 CT_ARCH_arm=y
+# CT_ARCH_avr32 is not set
+# CT_ARCH_blackfin is not set
+# CT_ARCH_mips is not set
+# CT_ARCH_powerpc is not set
+# CT_ARCH_sh is not set
+# CT_ARCH_sparc is not set
+# CT_ARCH_x86 is not set
+CT_ARCH_alpha_AVAILABLE=y
 CT_ARCH_arm_AVAILABLE=y
+CT_ARCH_avr32_AVAILABLE=y
+CT_ARCH_blackfin_AVAILABLE=y
+CT_ARCH_m68k_AVAILABLE=y
+CT_ARCH_microblaze_AVAILABLE=y
+CT_ARCH_mips_AVAILABLE=y
+CT_ARCH_powerpc_AVAILABLE=y
+CT_ARCH_s390_AVAILABLE=y
+CT_ARCH_sh_AVAILABLE=y
+CT_ARCH_sparc_AVAILABLE=y
+CT_ARCH_x86_AVAILABLE=y
 
 #
 # Generic target options
@@ -178,24 +195,31 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.5"
+CT_KERNEL_VERSION="3.6.3"
+# CT_KERNEL_bare_metal is not set
 CT_KERNEL_linux=y
+CT_KERNEL_bare_metal_AVAILABLE=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_5=y
-# CT_KERNEL_V_3_4_7 is not set
+CT_KERNEL_V_3_6_3=y
+# CT_KERNEL_V_3_6_2 is not set
+# CT_KERNEL_V_3_6_1 is not set
+# CT_KERNEL_V_3_6 is not set
+# CT_KERNEL_V_3_5_7 is not set
+# CT_KERNEL_V_3_4_15 is not set
 # CT_KERNEL_V_3_3_8 is not set
-# CT_KERNEL_V_3_2_25 is not set
+# CT_KERNEL_V_3_2_32 is not set
 # CT_KERNEL_V_3_1_10 is not set
-# CT_KERNEL_V_3_0_39 is not set
+# CT_KERNEL_V_3_0_48 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
 # CT_KERNEL_V_2_6_33_20 is not set
-# CT_KERNEL_V_2_6_32_59 is not set
+# CT_KERNEL_V_2_6_32_60 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_62 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
+CT_KERNEL_mingw32_AVAILABLE=y
 
 #
 # Common kernel options
@@ -235,6 +259,7 @@ CT_BINUTILS_LINKER_LD=y
 CT_BINUTILS_LINKERS_LIST="ld"
 CT_BINUTILS_LINKER_DEFAULT="bfd"
 CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
+# CT_BINUTILS_FOR_TARGET is not set
 
 #
 # C compiler
@@ -242,6 +267,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
+# CT_CC_V_4_7_2 is not set
 # CT_CC_V_4_6_3 is not set
 # CT_CC_V_4_6_2 is not set
 # CT_CC_V_4_6_1 is not set
@@ -322,9 +348,11 @@ CT_CC_GCC_LDBL_128=m
 #
 CT_LIBC="glibc"
 CT_LIBC_VERSION="2.9"
+# CT_LIBC_eglibc is not set
 CT_LIBC_glibc=y
+# CT_LIBC_uClibc is not set
+CT_LIBC_eglibc_AVAILABLE=y
 CT_LIBC_glibc_AVAILABLE=y
-CT_LIBC_GLIBC_TARBALL=y
 # CT_LIBC_GLIBC_V_2_14_1 is not set
 # CT_LIBC_GLIBC_V_2_14 is not set
 # CT_LIBC_GLIBC_V_2_13 is not set
@@ -335,6 +363,10 @@ CT_LIBC_GLIBC_TARBALL=y
 # CT_LIBC_GLIBC_V_2_10_1 is not set
 CT_LIBC_GLIBC_V_2_9=y
 # CT_LIBC_GLIBC_V_2_8 is not set
+CT_LIBC_mingw_AVAILABLE=y
+CT_LIBC_newlib_AVAILABLE=y
+CT_LIBC_none_AVAILABLE=y
+CT_LIBC_uClibc_AVAILABLE=y
 CT_LIBC_SUPPORT_THREADS_ANY=y
 CT_LIBC_SUPPORT_NPTL=y
 CT_THREADS="nptl"
@@ -359,7 +391,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="3.5"
+CT_LIBC_GLIBC_MIN_KERNEL="3.6.3"
 
 #
 # glibc other options
@@ -388,7 +420,11 @@ CT_LIBC_GLIBC_MIN_KERNEL="3.5"
 #
 # Debug facilities
 #
+# CT_DEBUG_dmalloc is not set
+# CT_DEBUG_duma is not set
 # CT_DEBUG_gdb is not set
+# CT_DEBUG_ltrace is not set
+# CT_DEBUG_strace is not set
 
 #
 # Companion libraries
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 5155e6c..8ad481f 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,12 +1,10 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG 1.16.0 Configuration
-# Sun Aug  5 17:33:46 2012
+# crosstool-NG 1.17.0 Configuration
+# Mon Dec  3 20:17:58 2012
 #
 CT_CONFIGURE_has_xz=y
-CT_CONFIGURE_has_cvs=y
 CT_CONFIGURE_has_svn=y
-CT_BACKEND=y
 CT_MODULES=y
 
 #
@@ -18,15 +16,16 @@ CT_MODULES=y
 #
 # CT_OBSOLETE is not set
 # CT_EXPERIMENTAL is not set
+# CT_DEBUG_CT is not set
 
 #
 # Paths
 #
 CT_LOCAL_TARBALLS_DIR=""
-CT_SAVE_TARBALLS=y
 CT_WORK_DIR="${CT_TOP_DIR}/.build"
 CT_PREFIX_DIR=""
 CT_INSTALL_DIR="${CT_PREFIX_DIR}"
+CT_RM_RF_PREFIX_DIR=y
 CT_REMOVE_DOCS=y
 # CT_INSTALL_DIR_RO is not set
 # CT_STRIP_ALL_TOOLCHAIN_EXECUTABLES is not set
@@ -58,16 +57,15 @@ CT_PATCH_ORDER="bundled"
 #
 # Build behavior
 #
-
-#
-# Build options hiden
-#
 CT_PARALLEL_JOBS=0
 CT_LOAD=0
 CT_USE_PIPES=y
 CT_EXTRA_FLAGS_FOR_HOST=""
-CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
-CT_CONFIG_SHELL="/bin/sh"
+# CT_CONFIG_SHELL_SH is not set
+# CT_CONFIG_SHELL_ASH is not set
+CT_CONFIG_SHELL_BASH=y
+# CT_CONFIG_SHELL_CUSTOM is not set
+CT_CONFIG_SHELL="${bash}"
 
 #
 # Logging
@@ -111,8 +109,27 @@ CT_ARCH_BITNESS=32
 CT_ARCH_FLOAT_SW=y
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
+# CT_ARCH_alpha is not set
 CT_ARCH_arm=y
+# CT_ARCH_avr32 is not set
+# CT_ARCH_blackfin is not set
+# CT_ARCH_mips is not set
+# CT_ARCH_powerpc is not set
+# CT_ARCH_sh is not set
+# CT_ARCH_sparc is not set
+# CT_ARCH_x86 is not set
+CT_ARCH_alpha_AVAILABLE=y
 CT_ARCH_arm_AVAILABLE=y
+CT_ARCH_avr32_AVAILABLE=y
+CT_ARCH_blackfin_AVAILABLE=y
+CT_ARCH_m68k_AVAILABLE=y
+CT_ARCH_microblaze_AVAILABLE=y
+CT_ARCH_mips_AVAILABLE=y
+CT_ARCH_powerpc_AVAILABLE=y
+CT_ARCH_s390_AVAILABLE=y
+CT_ARCH_sh_AVAILABLE=y
+CT_ARCH_sparc_AVAILABLE=y
+CT_ARCH_x86_AVAILABLE=y
 
 #
 # Generic target options
@@ -178,24 +195,31 @@ CT_BUILD_SUFFIX=""
 #
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="3.5"
+CT_KERNEL_VERSION="3.6.3"
+# CT_KERNEL_bare_metal is not set
 CT_KERNEL_linux=y
+CT_KERNEL_bare_metal_AVAILABLE=y
 CT_KERNEL_linux_AVAILABLE=y
-CT_KERNEL_V_3_5=y
-# CT_KERNEL_V_3_4_7 is not set
+CT_KERNEL_V_3_6_3=y
+# CT_KERNEL_V_3_6_2 is not set
+# CT_KERNEL_V_3_6_1 is not set
+# CT_KERNEL_V_3_6 is not set
+# CT_KERNEL_V_3_5_7 is not set
+# CT_KERNEL_V_3_4_15 is not set
 # CT_KERNEL_V_3_3_8 is not set
-# CT_KERNEL_V_3_2_25 is not set
+# CT_KERNEL_V_3_2_32 is not set
 # CT_KERNEL_V_3_1_10 is not set
-# CT_KERNEL_V_3_0_39 is not set
+# CT_KERNEL_V_3_0_48 is not set
 # CT_KERNEL_V_2_6_39_4 is not set
 # CT_KERNEL_V_2_6_38_8 is not set
 # CT_KERNEL_V_2_6_37_6 is not set
 # CT_KERNEL_V_2_6_36_4 is not set
 # CT_KERNEL_V_2_6_33_20 is not set
-# CT_KERNEL_V_2_6_32_59 is not set
+# CT_KERNEL_V_2_6_32_60 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
 # CT_KERNEL_V_2_6_27_62 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
+CT_KERNEL_mingw32_AVAILABLE=y
 
 #
 # Common kernel options
@@ -234,6 +258,7 @@ CT_BINUTILS_LINKER_LD=y
 CT_BINUTILS_LINKERS_LIST="ld"
 CT_BINUTILS_LINKER_DEFAULT="bfd"
 CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
+# CT_BINUTILS_FOR_TARGET is not set
 
 #
 # C compiler
@@ -241,6 +266,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.6"
 CT_CC_gcc=y
+# CT_CC_V_4_7_2 is not set
 # CT_CC_V_4_6_3 is not set
 # CT_CC_V_4_6_2 is not set
 # CT_CC_V_4_6_1 is not set
@@ -321,7 +347,14 @@ CT_CC_GCC_LDBL_128=m
 #
 CT_LIBC="uClibc"
 CT_LIBC_VERSION="0.9.33.2"
+# CT_LIBC_eglibc is not set
+# CT_LIBC_glibc is not set
 CT_LIBC_uClibc=y
+CT_LIBC_eglibc_AVAILABLE=y
+CT_LIBC_glibc_AVAILABLE=y
+CT_LIBC_mingw_AVAILABLE=y
+CT_LIBC_newlib_AVAILABLE=y
+CT_LIBC_none_AVAILABLE=y
 CT_LIBC_uClibc_AVAILABLE=y
 CT_LIBC_UCLIBC_V_0_9_33_2=y
 # CT_LIBC_UCLIBC_V_0_9_33_1 is not set
@@ -369,7 +402,11 @@ CT_LIBC_UCLIBC_WCHAR=y
 #
 # Debug facilities
 #
+# CT_DEBUG_dmalloc is not set
+# CT_DEBUG_duma is not set
 # CT_DEBUG_gdb is not set
+# CT_DEBUG_ltrace is not set
+# CT_DEBUG_strace is not set
 
 #
 # Companion libraries
