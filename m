From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun,  7 Aug 2011 22:37:58 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/crosstool-NG: update bundled
	config files
In-Reply-To: <1312749478-10361-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312749478-10361-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312749478-10361-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the crosstool-NG libc-specific config files to match the
new set of options coming with the updated crosstool-NG.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 .../crosstool-ng.config-eglibc                     |  227 ++++++-------------
 .../crosstool-ng.config-glibc                      |  234 ++++++--------------
 .../crosstool-ng.config-uClibc                     |  192 ++++------------
 3 files changed, 180 insertions(+), 473 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 5902d40..3b6a2e2 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,8 +1,14 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.11.3
-# Sat May 21 22:35:30 2011
-#
+# The crosstool-NG configuration menu
+# Sun Aug  7 15:40:17 2011
+#
+CT_CONFIGURE_has_cvs=y
+CT_CONFIGURE_has_svn=y
+CT_CONFIGURE_static_link_ok=y
+CT_CONFIGURE_has_static_libstdcxx=y
+CT_CONFIGURE_has_expat=y
+CT_CONFIGURE_has_static_expat=y
 CT_BACKEND=y
 CT_MODULES=y
 
@@ -51,8 +57,6 @@ CT_PATCH_BUNDLED=y
 # CT_PATCH_LOCAL_FALLBACK_BUNDLED is not set
 # CT_PATCH_NONE is not set
 CT_PATCH_ORDER="bundled"
-# CT_PATCH_SINGLE is not set
-# CT_PATCH_USE_LOCAL is not set
 
 #
 # Build behavior
@@ -84,55 +88,24 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="arm"
-CT_ARCH_SUPPORTS_BOTH_MMU=y
-CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
+CT_ARCH="x86"
 CT_ARCH_SUPPORTS_32=y
-# CT_ARCH_SUPPORTS_64 is not set
+CT_ARCH_SUPPORTS_64=y
 CT_ARCH_SUPPORT_ARCH=y
-# CT_ARCH_SUPPORT_ABI is not set
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
-CT_ARCH_SUPPORT_FPU=y
-CT_ARCH_DEFAULT_HAS_MMU=y
-# CT_ARCH_DEFAULT_BE is not set
-CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
-# CT_ARCH_DEFAULT_64 is not set
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
-CT_ARCH_TUNE=""
-CT_ARCH_FPU=""
-# CT_ARCH_BE is not set
-CT_ARCH_LE=y
-CT_ARCH_32=y
-# CT_ARCH_64 is not set
-CT_ARCH_BITNESS=32
+CT_ARCH_TUNE="generic"
+# CT_ARCH_32 is not set
+CT_ARCH_64=y
+CT_ARCH_BITNESS=64
 CT_ARCH_FLOAT_HW=y
 # CT_ARCH_FLOAT_SW is not set
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-# CT_ARCH_alpha is not set
-CT_ARCH_arm=y
-# CT_ARCH_avr32 is not set
-# CT_ARCH_blackfin is not set
-# CT_ARCH_m68k is not set
-# CT_ARCH_mips is not set
-# CT_ARCH_powerpc is not set
-# CT_ARCH_s390 is not set
-# CT_ARCH_sh is not set
-# CT_ARCH_sparc is not set
-# CT_ARCH_x86 is not set
-CT_ARCH_alpha_AVAILABLE=y
-CT_ARCH_arm_AVAILABLE=y
-CT_ARCH_avr32_AVAILABLE=y
-CT_ARCH_blackfin_AVAILABLE=y
-CT_ARCH_m68k_AVAILABLE=y
-CT_ARCH_mips_AVAILABLE=y
-CT_ARCH_powerpc_AVAILABLE=y
-CT_ARCH_s390_AVAILABLE=y
-CT_ARCH_sh_AVAILABLE=y
-CT_ARCH_sparc_AVAILABLE=y
+CT_ARCH_x86=y
 CT_ARCH_x86_AVAILABLE=y
 
 #
@@ -145,14 +118,6 @@ CT_ARCH_USE_MMU=y
 #
 
 #
-# arm other options
-#
-CT_ARCH_ARM_MODE="arm"
-CT_ARCH_ARM_MODE_ARM=y
-# CT_ARCH_ARM_MODE_THUMB is not set
-CT_ARCH_ARM_EABI=y
-
-#
 # Toolchain options
 #
 
@@ -163,6 +128,9 @@ CT_FORCE_SYSROOT=y
 CT_USE_SYSROOT=y
 CT_SYSROOT_NAME="sysroot"
 CT_SYSROOT_DIR_PREFIX=""
+CT_STATIC_TOOLCHAIN_POSSIBLE=y
+CT_TOOLCHAIN_PKGVERSION=""
+CT_TOOLCHAIN_BUGURL=""
 
 #
 # Tuple completion and aliasing
@@ -174,10 +142,7 @@ CT_TARGET_ALIAS=""
 #
 # Toolchain type
 #
-# CT_NATIVE is not set
 CT_CROSS=y
-# CT_CROSS_NATIVE is not set
-# CT_CANADIAN is not set
 CT_TOOLCHAIN_TYPE="cross"
 
 #
@@ -190,17 +155,28 @@ CT_BUILD_SUFFIX=""
 #
 # Operating System
 #
-# CT_BARE_METAL is not set
-# CT_MINGW32 is not set
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.38.4"
-# CT_KERNEL_bare_metal is not set
+CT_KERNEL_VERSION="2.6.38.8"
 CT_KERNEL_linux=y
-# CT_KERNEL_mingw32 is not set
-# CT_KERNEL_bare_metal_AVAILABLE is not set
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_mingw32_AVAILABLE is not set
+CT_KERNEL_LINUX_INSTALL=y
+# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+# CT_KERNEL_V_3_0 is not set
+# CT_KERNEL_V_2_6_39_3 is not set
+# CT_KERNEL_V_2_6_39_2 is not set
+# CT_KERNEL_V_2_6_39_1 is not set
+# CT_KERNEL_V_2_6_39 is not set
+CT_KERNEL_V_2_6_38_8=y
+# CT_KERNEL_V_2_6_37_6 is not set
+# CT_KERNEL_V_2_6_36_4 is not set
+# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_34_10 is not set
+# CT_KERNEL_V_2_6_33_16 is not set
+# CT_KERNEL_V_2_6_32_43 is not set
+# CT_KERNEL_V_2_6_31_14 is not set
+# CT_KERNEL_V_2_6_27_59 is not set
+# CT_KERNEL_LINUX_CUSTOM is not set
 
 #
 # Common kernel options
@@ -210,22 +186,6 @@ CT_SHARED_LIBS=y
 #
 # linux other options
 #
-CT_KERNEL_LINUX_INSTALL=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
-CT_KERNEL_V_2_6_38_4=y
-# CT_KERNEL_V_2_6_38_3 is not set
-# CT_KERNEL_V_2_6_38_2 is not set
-# CT_KERNEL_V_2_6_38_1 is not set
-# CT_KERNEL_V_2_6_38 is not set
-# CT_KERNEL_V_2_6_37_6 is not set
-# CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_13 is not set
-# CT_KERNEL_V_2_6_34_9 is not set
-# CT_KERNEL_V_2_6_33_12 is not set
-# CT_KERNEL_V_2_6_32_39 is not set
-# CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_58 is not set
-# CT_KERNEL_LINUX_CUSTOM is not set
 CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
@@ -236,30 +196,26 @@ CT_KERNEL_LINUX_INSTALL_CHECK=y
 # Binary utilities
 #
 CT_ARCH_BINFMT_ELF=y
-# CT_ARCH_BINFMT_FLAT is not set
-# CT_ARCH_BINFMT_FDPIC is not set
 
 #
 # GNU binutils
 #
-# CT_BINUTILS_V_2_21 is not set
 # CT_BINUTILS_V_2_20_1 is not set
 CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_19_1 is not set
 # CT_BINUTILS_V_2_19 is not set
 # CT_BINUTILS_V_2_18 is not set
-# CT_BINUTILS_V_2_17 is not set
-# CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
+CT_BINUTILS_2_20_or_later=y
+CT_BINUTILS_2_19_or_later=y
+CT_BINUTILS_2_18_or_later=y
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
+CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
 CT_BINUTILS_FORCE_LD_BFD=y
 CT_BINUTILS_LINKER_LD=y
-# CT_BINUTILS_LINKER_GOLD is not set
-# CT_BINUTILS_LINKER_LD_GOLD is not set
-# CT_BINUTILS_LINKER_GOLD_LD is not set
 CT_BINUTILS_LINKERS_LIST="ld"
 CT_BINUTILS_LINKER_DEFAULT="bfd"
-CT_BINUTILS_EXTRA_CONFIG=""
+CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 
 #
 # C compiler
@@ -267,13 +223,6 @@ CT_BINUTILS_EXTRA_CONFIG=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.3"
 CT_CC_gcc=y
-# CT_CC_V_linaro_4_6_2011_04_0 is not set
-# CT_CC_V_4_6_0 is not set
-# CT_CC_V_linaro_4_5_2011_04_0 is not set
-# CT_CC_V_4_5_2 is not set
-# CT_CC_V_4_5_1 is not set
-# CT_CC_V_4_5_0 is not set
-# CT_CC_V_linaro_4_4_2011_02_0 is not set
 # CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
@@ -281,35 +230,23 @@ CT_CC_V_4_4_3=y
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
+# CT_CC_V_4_3_6 is not set
 # CT_CC_V_4_3_5 is not set
 # CT_CC_V_4_3_4 is not set
 # CT_CC_V_4_3_3 is not set
 # CT_CC_V_4_3_2 is not set
 # CT_CC_V_4_3_1 is not set
 # CT_CC_V_4_2_4 is not set
-# CT_CC_V_4_2_3 is not set
 # CT_CC_V_4_2_2 is not set
-# CT_CC_V_4_2_1 is not set
-# CT_CC_V_4_2_0 is not set
-# CT_CC_V_4_1_2 is not set
-# CT_CC_V_4_0_4 is not set
-# CT_CC_V_3_4_6 is not set
-# CT_CC_GCC_4_2 is not set
 CT_CC_GCC_4_2_or_later=y
-# CT_CC_GCC_4_3 is not set
 CT_CC_GCC_4_3_or_later=y
 CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
-# CT_CC_GCC_4_5 is not set
-# CT_CC_GCC_4_5_or_later is not set
-# CT_CC_GCC_4_6 is not set
-# CT_CC_GCC_4_6_or_later is not set
 CT_CC_GCC_HAS_GRAPHITE=y
-# CT_CC_GCC_HAS_LTO is not set
+CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
-# CT_CC_GCC_USE_MPC is not set
-# CT_CC_GCC_USE_LIBELF is not set
+# CT_CC_LANG_FORTRAN is not set
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -321,17 +258,14 @@ CT_CC_SUPPORT_OBJCXX=y
 # Additional supported languages:
 #
 # CT_CC_LANG_CXX is not set
-# CT_CC_LANG_FORTRAN is not set
 # CT_CC_LANG_JAVA is not set
 
 #
 # gcc other options
 #
-CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
-CT_CC_BUGURL=""
 CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG=""
-CT_CC_EXTRA_CONFIG=""
+CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
+CT_CC_EXTRA_CONFIG_ARRAY=""
 CT_CC_STATIC_LIBSTDCXX=y
 
 #
@@ -361,43 +295,43 @@ CT_CC_GCC_LDBL_128=m
 CT_LIBC="eglibc"
 CT_LIBC_VERSION="2_10"
 CT_LIBC_eglibc=y
-# CT_LIBC_glibc is not set
-# CT_LIBC_mingw is not set
-# CT_LIBC_newlib is not set
-# CT_LIBC_none is not set
-# CT_LIBC_uClibc is not set
 CT_LIBC_eglibc_AVAILABLE=y
-# CT_LIBC_EGLIBC_V_2_13 is not set
 # CT_LIBC_EGLIBC_V_2_12 is not set
 # CT_LIBC_EGLIBC_V_2_11 is not set
 CT_LIBC_EGLIBC_V_2_10=y
 # CT_LIBC_EGLIBC_V_2_9 is not set
-# CT_LIBC_EGLIBC_V_2_8 is not set
-# CT_LIBC_EGLIBC_V_2_7 is not set
-# CT_LIBC_EGLIBC_V_2_6 is not set
-# CT_LIBC_EGLIBC_V_2_5 is not set
 # CT_LIBC_EGLIBC_V_TRUNK is not set
+CT_LIBC_EGLIBC_2_10_or_later=y
+CT_LIBC_EGLIBC_2_9_or_later=y
+CT_LIBC_EGLIBC_HAS_PKGVERSION_BUGURL=y
 CT_EGLIBC_REVISION="HEAD"
+# CT_EGLIBC_HTTP is not set
 # CT_EGLIBC_CHECKOUT is not set
 # CT_EGLIBC_OPT_SIZE is not set
 # CT_EGLIBC_CUSTOM_CONFIG is not set
-# CT_LIBC_glibc_AVAILABLE is not set
-# CT_LIBC_mingw_AVAILABLE is not set
-# CT_LIBC_newlib_AVAILABLE is not set
-# CT_LIBC_none_AVAILABLE is not set
-# CT_LIBC_uClibc_AVAILABLE is not set
-CT_LIBC_glibc_familly=y
+CT_LIBC_SUPPORT_THREADS_ANY=y
+CT_LIBC_SUPPORT_NPTL=y
+CT_LIBC_SUPPORT_LINUXTHREADS=y
+CT_THREADS="nptl"
 
 #
-# glibc/eglibc common options
+# Common C library options
 #
-CT_LIBC_GLIBC_EXTRA_CONFIG=""
+CT_THREADS_NPTL=y
+# CT_THREADS_LINUXTHREADS is not set
+CT_LIBC_XLDD=y
+
+#
+# eglibc other options
+#
+CT_LIBC_glibc_familly=y
+CT_LIBC_GLIBC_EXTRA_CONFIG_ARRAY=""
 CT_LIBC_GLIBC_CONFIGPARMS=""
 CT_LIBC_GLIBC_EXTRA_CFLAGS=""
 CT_LIBC_EXTRA_CC_ARGS=""
 # CT_LIBC_DISABLE_VERSIONING is not set
 CT_LIBC_OLDEST_ABI=""
-# CT_LIBC_GLIBC_FORCE_UNWIND is not set
+CT_LIBC_GLIBC_FORCE_UNWIND=y
 CT_LIBC_GLIBC_USE_PORTS=y
 CT_LIBC_ADDONS_LIST=""
 
@@ -423,22 +357,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="2.6.38.4"
-CT_LIBC_SUPPORT_THREADS_ANY=y
-CT_LIBC_SUPPORT_NPTL=y
-CT_LIBC_SUPPORT_LINUXTHREADS=y
-# CT_LIBC_SUPPORT_WIN32THREADS is not set
-# CT_LIBC_SUPPORT_THREADS_NONE is not set
-CT_THREADS="nptl"
-
-#
-# Common C library options
-#
-CT_THREADS_NPTL=y
-# CT_THREADS_LINUXTHREADS is not set
-# CT_THREADS_WIN32THREADS is not set
-# CT_THREADS_NONE is not set
-CT_LIBC_XLDD=y
+CT_LIBC_GLIBC_MIN_KERNEL="2.6.38.8"
 
 #
 # Debug facilities
@@ -453,34 +372,22 @@ CT_GMP_NEEDED=y
 CT_MPFR_NEEDED=y
 CT_PPL_NEEDED=y
 CT_CLOOG_NEEDED=y
-# CT_MPC_NEEDED is not set
-# CT_LIBELF_NEEDED is not set
 CT_COMPLIBS=y
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
-# CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_3_1 is not set
 # CT_GMP_V_4_3_0 is not set
-# CT_GMP_V_4_2_4 is not set
-# CT_GMP_V_4_2_2 is not set
 CT_GMP_VERSION="4.3.2"
 # CT_MPFR_V_3_0_0 is not set
 CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
-# CT_MPFR_V_2_3_2 is not set
-# CT_MPFR_V_2_3_1 is not set
 CT_MPFR_VERSION="2.4.2"
-# CT_PPL_V_0_11_2 is not set
-# CT_PPL_V_0_11_1 is not set
-# CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
-# CT_PPL_0_11 is not set
-# CT_PPL_NEEDS_LIBPWL is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index f7c0de7..cadbb0b 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,8 +1,14 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.11.3
-# Sat May 21 22:36:05 2011
-#
+# The crosstool-NG configuration menu
+# Sun Aug  7 15:49:35 2011
+#
+CT_CONFIGURE_has_cvs=y
+CT_CONFIGURE_has_svn=y
+CT_CONFIGURE_static_link_ok=y
+CT_CONFIGURE_has_static_libstdcxx=y
+CT_CONFIGURE_has_expat=y
+CT_CONFIGURE_has_static_expat=y
 CT_BACKEND=y
 CT_MODULES=y
 
@@ -51,8 +57,6 @@ CT_PATCH_BUNDLED=y
 # CT_PATCH_LOCAL_FALLBACK_BUNDLED is not set
 # CT_PATCH_NONE is not set
 CT_PATCH_ORDER="bundled"
-# CT_PATCH_SINGLE is not set
-# CT_PATCH_USE_LOCAL is not set
 
 #
 # Build behavior
@@ -84,55 +88,24 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="arm"
-CT_ARCH_SUPPORTS_BOTH_MMU=y
-CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
+CT_ARCH="x86"
 CT_ARCH_SUPPORTS_32=y
-# CT_ARCH_SUPPORTS_64 is not set
+CT_ARCH_SUPPORTS_64=y
 CT_ARCH_SUPPORT_ARCH=y
-# CT_ARCH_SUPPORT_ABI is not set
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
-CT_ARCH_SUPPORT_FPU=y
-CT_ARCH_DEFAULT_HAS_MMU=y
-# CT_ARCH_DEFAULT_BE is not set
-CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
-# CT_ARCH_DEFAULT_64 is not set
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
-CT_ARCH_TUNE=""
-CT_ARCH_FPU=""
-# CT_ARCH_BE is not set
-CT_ARCH_LE=y
-CT_ARCH_32=y
-# CT_ARCH_64 is not set
-CT_ARCH_BITNESS=32
+CT_ARCH_TUNE="generic"
+# CT_ARCH_32 is not set
+CT_ARCH_64=y
+CT_ARCH_BITNESS=64
 CT_ARCH_FLOAT_HW=y
 # CT_ARCH_FLOAT_SW is not set
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-# CT_ARCH_alpha is not set
-CT_ARCH_arm=y
-# CT_ARCH_avr32 is not set
-# CT_ARCH_blackfin is not set
-# CT_ARCH_m68k is not set
-# CT_ARCH_mips is not set
-# CT_ARCH_powerpc is not set
-# CT_ARCH_s390 is not set
-# CT_ARCH_sh is not set
-# CT_ARCH_sparc is not set
-# CT_ARCH_x86 is not set
-CT_ARCH_alpha_AVAILABLE=y
-CT_ARCH_arm_AVAILABLE=y
-CT_ARCH_avr32_AVAILABLE=y
-CT_ARCH_blackfin_AVAILABLE=y
-CT_ARCH_m68k_AVAILABLE=y
-CT_ARCH_mips_AVAILABLE=y
-CT_ARCH_powerpc_AVAILABLE=y
-CT_ARCH_s390_AVAILABLE=y
-CT_ARCH_sh_AVAILABLE=y
-CT_ARCH_sparc_AVAILABLE=y
+CT_ARCH_x86=y
 CT_ARCH_x86_AVAILABLE=y
 
 #
@@ -145,14 +118,6 @@ CT_ARCH_USE_MMU=y
 #
 
 #
-# arm other options
-#
-CT_ARCH_ARM_MODE="arm"
-CT_ARCH_ARM_MODE_ARM=y
-# CT_ARCH_ARM_MODE_THUMB is not set
-CT_ARCH_ARM_EABI=y
-
-#
 # Toolchain options
 #
 
@@ -163,21 +128,21 @@ CT_FORCE_SYSROOT=y
 CT_USE_SYSROOT=y
 CT_SYSROOT_NAME="sysroot"
 CT_SYSROOT_DIR_PREFIX=""
+CT_STATIC_TOOLCHAIN_POSSIBLE=y
+CT_TOOLCHAIN_PKGVERSION=""
+CT_TOOLCHAIN_BUGURL=""
 
 #
 # Tuple completion and aliasing
 #
 CT_TARGET_VENDOR="unknown"
 CT_TARGET_ALIAS_SED_EXPR=""
-CT_TARGET_ALIAS=""
+CT_TARGET_ALIAS="x86_64-linux"
 
 #
 # Toolchain type
 #
-# CT_NATIVE is not set
 CT_CROSS=y
-# CT_CROSS_NATIVE is not set
-# CT_CANADIAN is not set
 CT_TOOLCHAIN_TYPE="cross"
 
 #
@@ -190,17 +155,28 @@ CT_BUILD_SUFFIX=""
 #
 # Operating System
 #
-# CT_BARE_METAL is not set
-# CT_MINGW32 is not set
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.38.4"
-# CT_KERNEL_bare_metal is not set
+CT_KERNEL_VERSION="3.0"
 CT_KERNEL_linux=y
-# CT_KERNEL_mingw32 is not set
-# CT_KERNEL_bare_metal_AVAILABLE is not set
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_mingw32_AVAILABLE is not set
+CT_KERNEL_LINUX_INSTALL=y
+# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+CT_KERNEL_V_3_0=y
+# CT_KERNEL_V_2_6_39_3 is not set
+# CT_KERNEL_V_2_6_39_2 is not set
+# CT_KERNEL_V_2_6_39_1 is not set
+# CT_KERNEL_V_2_6_39 is not set
+# CT_KERNEL_V_2_6_38_8 is not set
+# CT_KERNEL_V_2_6_37_6 is not set
+# CT_KERNEL_V_2_6_36_4 is not set
+# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_34_10 is not set
+# CT_KERNEL_V_2_6_33_16 is not set
+# CT_KERNEL_V_2_6_32_43 is not set
+# CT_KERNEL_V_2_6_31_14 is not set
+# CT_KERNEL_V_2_6_27_59 is not set
+# CT_KERNEL_LINUX_CUSTOM is not set
 
 #
 # Common kernel options
@@ -210,22 +186,6 @@ CT_SHARED_LIBS=y
 #
 # linux other options
 #
-CT_KERNEL_LINUX_INSTALL=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
-CT_KERNEL_V_2_6_38_4=y
-# CT_KERNEL_V_2_6_38_3 is not set
-# CT_KERNEL_V_2_6_38_2 is not set
-# CT_KERNEL_V_2_6_38_1 is not set
-# CT_KERNEL_V_2_6_38 is not set
-# CT_KERNEL_V_2_6_37_6 is not set
-# CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_13 is not set
-# CT_KERNEL_V_2_6_34_9 is not set
-# CT_KERNEL_V_2_6_33_12 is not set
-# CT_KERNEL_V_2_6_32_39 is not set
-# CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_58 is not set
-# CT_KERNEL_LINUX_CUSTOM is not set
 CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
@@ -236,30 +196,26 @@ CT_KERNEL_LINUX_INSTALL_CHECK=y
 # Binary utilities
 #
 CT_ARCH_BINFMT_ELF=y
-# CT_ARCH_BINFMT_FLAT is not set
-# CT_ARCH_BINFMT_FDPIC is not set
 
 #
 # GNU binutils
 #
-# CT_BINUTILS_V_2_21 is not set
 # CT_BINUTILS_V_2_20_1 is not set
 CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_19_1 is not set
 # CT_BINUTILS_V_2_19 is not set
 # CT_BINUTILS_V_2_18 is not set
-# CT_BINUTILS_V_2_17 is not set
-# CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
+CT_BINUTILS_2_20_or_later=y
+CT_BINUTILS_2_19_or_later=y
+CT_BINUTILS_2_18_or_later=y
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
+CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
 CT_BINUTILS_FORCE_LD_BFD=y
 CT_BINUTILS_LINKER_LD=y
-# CT_BINUTILS_LINKER_GOLD is not set
-# CT_BINUTILS_LINKER_LD_GOLD is not set
-# CT_BINUTILS_LINKER_GOLD_LD is not set
 CT_BINUTILS_LINKERS_LIST="ld"
 CT_BINUTILS_LINKER_DEFAULT="bfd"
-CT_BINUTILS_EXTRA_CONFIG=""
+CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 
 #
 # C compiler
@@ -267,13 +223,6 @@ CT_BINUTILS_EXTRA_CONFIG=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.3"
 CT_CC_gcc=y
-# CT_CC_V_linaro_4_6_2011_04_0 is not set
-# CT_CC_V_4_6_0 is not set
-# CT_CC_V_linaro_4_5_2011_04_0 is not set
-# CT_CC_V_4_5_2 is not set
-# CT_CC_V_4_5_1 is not set
-# CT_CC_V_4_5_0 is not set
-# CT_CC_V_linaro_4_4_2011_02_0 is not set
 # CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
@@ -281,35 +230,23 @@ CT_CC_V_4_4_3=y
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
+# CT_CC_V_4_3_6 is not set
 # CT_CC_V_4_3_5 is not set
 # CT_CC_V_4_3_4 is not set
 # CT_CC_V_4_3_3 is not set
 # CT_CC_V_4_3_2 is not set
 # CT_CC_V_4_3_1 is not set
 # CT_CC_V_4_2_4 is not set
-# CT_CC_V_4_2_3 is not set
 # CT_CC_V_4_2_2 is not set
-# CT_CC_V_4_2_1 is not set
-# CT_CC_V_4_2_0 is not set
-# CT_CC_V_4_1_2 is not set
-# CT_CC_V_4_0_4 is not set
-# CT_CC_V_3_4_6 is not set
-# CT_CC_GCC_4_2 is not set
 CT_CC_GCC_4_2_or_later=y
-# CT_CC_GCC_4_3 is not set
 CT_CC_GCC_4_3_or_later=y
 CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
-# CT_CC_GCC_4_5 is not set
-# CT_CC_GCC_4_5_or_later is not set
-# CT_CC_GCC_4_6 is not set
-# CT_CC_GCC_4_6_or_later is not set
 CT_CC_GCC_HAS_GRAPHITE=y
-# CT_CC_GCC_HAS_LTO is not set
+CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
-# CT_CC_GCC_USE_MPC is not set
-# CT_CC_GCC_USE_LIBELF is not set
+# CT_CC_LANG_FORTRAN is not set
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -321,17 +258,14 @@ CT_CC_SUPPORT_OBJCXX=y
 # Additional supported languages:
 #
 # CT_CC_LANG_CXX is not set
-# CT_CC_LANG_FORTRAN is not set
 # CT_CC_LANG_JAVA is not set
 
 #
 # gcc other options
 #
-CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
-CT_CC_BUGURL=""
 CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG=""
-CT_CC_EXTRA_CONFIG=""
+CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
+CT_CC_EXTRA_CONFIG_ARRAY=""
 CT_CC_STATIC_LIBSTDCXX=y
 
 #
@@ -360,45 +294,38 @@ CT_CC_GCC_LDBL_128=m
 #
 CT_LIBC="glibc"
 CT_LIBC_VERSION="2.9"
-# CT_LIBC_eglibc is not set
 CT_LIBC_glibc=y
-# CT_LIBC_mingw is not set
-# CT_LIBC_newlib is not set
-# CT_LIBC_none is not set
-# CT_LIBC_uClibc is not set
-# CT_LIBC_eglibc_AVAILABLE is not set
 CT_LIBC_glibc_AVAILABLE=y
 CT_LIBC_GLIBC_TARBALL=y
-# CT_LIBC_GLIBC_V_2_12_2 is not set
-# CT_LIBC_GLIBC_V_2_12_1 is not set
-# CT_LIBC_GLIBC_V_2_11_1 is not set
-# CT_LIBC_GLIBC_V_2_11 is not set
-# CT_LIBC_GLIBC_V_2_10_1 is not set
 CT_LIBC_GLIBC_V_2_9=y
 # CT_LIBC_GLIBC_V_2_8 is not set
-# CT_LIBC_GLIBC_V_2_7 is not set
-# CT_LIBC_GLIBC_V_2_6_1 is not set
-# CT_LIBC_GLIBC_V_2_6 is not set
-# CT_LIBC_GLIBC_V_2_5_1 is not set
-# CT_LIBC_GLIBC_V_2_5 is not set
-# CT_LIBC_mingw_AVAILABLE is not set
-# CT_LIBC_newlib_AVAILABLE is not set
-# CT_LIBC_none_AVAILABLE is not set
-# CT_LIBC_uClibc_AVAILABLE is not set
-CT_LIBC_glibc_familly=y
+CT_LIBC_SUPPORT_THREADS_ANY=y
+CT_LIBC_SUPPORT_NPTL=y
+CT_THREADS="nptl"
 
 #
-# glibc/eglibc common options
+# Common C library options
 #
-CT_LIBC_GLIBC_EXTRA_CONFIG=""
+CT_THREADS_NPTL=y
+CT_LIBC_XLDD=y
+CT_LIBC_glibc_familly=y
+CT_LIBC_GLIBC_EXTRA_CONFIG_ARRAY=""
 CT_LIBC_GLIBC_CONFIGPARMS=""
 CT_LIBC_GLIBC_EXTRA_CFLAGS=""
 CT_LIBC_EXTRA_CC_ARGS=""
 # CT_LIBC_DISABLE_VERSIONING is not set
 CT_LIBC_OLDEST_ABI=""
-# CT_LIBC_GLIBC_FORCE_UNWIND is not set
+CT_LIBC_GLIBC_FORCE_UNWIND=y
 CT_LIBC_GLIBC_USE_PORTS=y
 CT_LIBC_ADDONS_LIST=""
+# CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
+CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
+# CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
+CT_LIBC_GLIBC_MIN_KERNEL="3.0"
+
+#
+# glibc other options
+#
 
 #
 # WARNING !!!                                            
@@ -419,25 +346,6 @@ CT_LIBC_ADDONS_LIST=""
 #
 #   or try again later... :-(                            
 #
-# CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
-CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
-# CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="2.6.38.4"
-CT_LIBC_SUPPORT_THREADS_ANY=y
-CT_LIBC_SUPPORT_NPTL=y
-# CT_LIBC_SUPPORT_LINUXTHREADS is not set
-# CT_LIBC_SUPPORT_WIN32THREADS is not set
-# CT_LIBC_SUPPORT_THREADS_NONE is not set
-CT_THREADS="nptl"
-
-#
-# Common C library options
-#
-CT_THREADS_NPTL=y
-# CT_THREADS_LINUXTHREADS is not set
-# CT_THREADS_WIN32THREADS is not set
-# CT_THREADS_NONE is not set
-CT_LIBC_XLDD=y
 
 #
 # Debug facilities
@@ -452,34 +360,22 @@ CT_GMP_NEEDED=y
 CT_MPFR_NEEDED=y
 CT_PPL_NEEDED=y
 CT_CLOOG_NEEDED=y
-# CT_MPC_NEEDED is not set
-# CT_LIBELF_NEEDED is not set
 CT_COMPLIBS=y
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
-# CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_3_1 is not set
 # CT_GMP_V_4_3_0 is not set
-# CT_GMP_V_4_2_4 is not set
-# CT_GMP_V_4_2_2 is not set
 CT_GMP_VERSION="4.3.2"
 # CT_MPFR_V_3_0_0 is not set
 CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
-# CT_MPFR_V_2_3_2 is not set
-# CT_MPFR_V_2_3_1 is not set
 CT_MPFR_VERSION="2.4.2"
-# CT_PPL_V_0_11_2 is not set
-# CT_PPL_V_0_11_1 is not set
-# CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
-# CT_PPL_0_11 is not set
-# CT_PPL_NEEDS_LIBPWL is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 5728e08..7d90e40 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,8 +1,14 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.11.3
-# Sat May 21 22:36:24 2011
-#
+# The crosstool-NG configuration menu
+# Sun Aug  7 15:06:46 2011
+#
+CT_CONFIGURE_has_cvs=y
+CT_CONFIGURE_has_svn=y
+CT_CONFIGURE_static_link_ok=y
+CT_CONFIGURE_has_static_libstdcxx=y
+CT_CONFIGURE_has_expat=y
+CT_CONFIGURE_has_static_expat=y
 CT_BACKEND=y
 CT_MODULES=y
 
@@ -51,8 +57,6 @@ CT_PATCH_BUNDLED=y
 # CT_PATCH_LOCAL_FALLBACK_BUNDLED is not set
 # CT_PATCH_NONE is not set
 CT_PATCH_ORDER="bundled"
-# CT_PATCH_SINGLE is not set
-# CT_PATCH_USE_LOCAL is not set
 
 #
 # Build behavior
@@ -84,55 +88,24 @@ CT_LOG_FILE_COMPRESS=y
 #
 # Target options
 #
-CT_ARCH="arm"
-CT_ARCH_SUPPORTS_BOTH_MMU=y
-CT_ARCH_SUPPORTS_BOTH_ENDIAN=y
+CT_ARCH="x86"
 CT_ARCH_SUPPORTS_32=y
-# CT_ARCH_SUPPORTS_64 is not set
+CT_ARCH_SUPPORTS_64=y
 CT_ARCH_SUPPORT_ARCH=y
-# CT_ARCH_SUPPORT_ABI is not set
 CT_ARCH_SUPPORT_CPU=y
 CT_ARCH_SUPPORT_TUNE=y
-CT_ARCH_SUPPORT_FPU=y
-CT_ARCH_DEFAULT_HAS_MMU=y
-# CT_ARCH_DEFAULT_BE is not set
-CT_ARCH_DEFAULT_LE=y
 CT_ARCH_DEFAULT_32=y
-# CT_ARCH_DEFAULT_64 is not set
 CT_ARCH_ARCH=""
 CT_ARCH_CPU=""
-CT_ARCH_TUNE=""
-CT_ARCH_FPU=""
-# CT_ARCH_BE is not set
-CT_ARCH_LE=y
-CT_ARCH_32=y
-# CT_ARCH_64 is not set
-CT_ARCH_BITNESS=32
+CT_ARCH_TUNE="generic"
+# CT_ARCH_32 is not set
+CT_ARCH_64=y
+CT_ARCH_BITNESS=64
 CT_ARCH_FLOAT_HW=y
 # CT_ARCH_FLOAT_SW is not set
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-# CT_ARCH_alpha is not set
-CT_ARCH_arm=y
-# CT_ARCH_avr32 is not set
-# CT_ARCH_blackfin is not set
-# CT_ARCH_m68k is not set
-# CT_ARCH_mips is not set
-# CT_ARCH_powerpc is not set
-# CT_ARCH_s390 is not set
-# CT_ARCH_sh is not set
-# CT_ARCH_sparc is not set
-# CT_ARCH_x86 is not set
-CT_ARCH_alpha_AVAILABLE=y
-CT_ARCH_arm_AVAILABLE=y
-CT_ARCH_avr32_AVAILABLE=y
-CT_ARCH_blackfin_AVAILABLE=y
-CT_ARCH_m68k_AVAILABLE=y
-CT_ARCH_mips_AVAILABLE=y
-CT_ARCH_powerpc_AVAILABLE=y
-CT_ARCH_s390_AVAILABLE=y
-CT_ARCH_sh_AVAILABLE=y
-CT_ARCH_sparc_AVAILABLE=y
+CT_ARCH_x86=y
 CT_ARCH_x86_AVAILABLE=y
 
 #
@@ -145,14 +118,6 @@ CT_ARCH_USE_MMU=y
 #
 
 #
-# arm other options
-#
-CT_ARCH_ARM_MODE="arm"
-CT_ARCH_ARM_MODE_ARM=y
-# CT_ARCH_ARM_MODE_THUMB is not set
-CT_ARCH_ARM_EABI=y
-
-#
 # Toolchain options
 #
 
@@ -163,6 +128,9 @@ CT_FORCE_SYSROOT=y
 CT_USE_SYSROOT=y
 CT_SYSROOT_NAME="sysroot"
 CT_SYSROOT_DIR_PREFIX=""
+CT_STATIC_TOOLCHAIN_POSSIBLE=y
+CT_TOOLCHAIN_PKGVERSION=""
+CT_TOOLCHAIN_BUGURL=""
 
 #
 # Tuple completion and aliasing
@@ -174,10 +142,7 @@ CT_TARGET_ALIAS=""
 #
 # Toolchain type
 #
-# CT_NATIVE is not set
 CT_CROSS=y
-# CT_CROSS_NATIVE is not set
-# CT_CANADIAN is not set
 CT_TOOLCHAIN_TYPE="cross"
 
 #
@@ -190,17 +155,28 @@ CT_BUILD_SUFFIX=""
 #
 # Operating System
 #
-# CT_BARE_METAL is not set
-# CT_MINGW32 is not set
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.38.4"
-# CT_KERNEL_bare_metal is not set
+CT_KERNEL_VERSION="2.6.38.8"
 CT_KERNEL_linux=y
-# CT_KERNEL_mingw32 is not set
-# CT_KERNEL_bare_metal_AVAILABLE is not set
 CT_KERNEL_linux_AVAILABLE=y
-# CT_KERNEL_mingw32_AVAILABLE is not set
+CT_KERNEL_LINUX_INSTALL=y
+# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+# CT_KERNEL_V_3_0 is not set
+# CT_KERNEL_V_2_6_39_3 is not set
+# CT_KERNEL_V_2_6_39_2 is not set
+# CT_KERNEL_V_2_6_39_1 is not set
+# CT_KERNEL_V_2_6_39 is not set
+CT_KERNEL_V_2_6_38_8=y
+# CT_KERNEL_V_2_6_37_6 is not set
+# CT_KERNEL_V_2_6_36_4 is not set
+# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_34_10 is not set
+# CT_KERNEL_V_2_6_33_16 is not set
+# CT_KERNEL_V_2_6_32_43 is not set
+# CT_KERNEL_V_2_6_31_14 is not set
+# CT_KERNEL_V_2_6_27_59 is not set
+# CT_KERNEL_LINUX_CUSTOM is not set
 
 #
 # Common kernel options
@@ -210,22 +186,6 @@ CT_SHARED_LIBS=y
 #
 # linux other options
 #
-CT_KERNEL_LINUX_INSTALL=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
-CT_KERNEL_V_2_6_38_4=y
-# CT_KERNEL_V_2_6_38_3 is not set
-# CT_KERNEL_V_2_6_38_2 is not set
-# CT_KERNEL_V_2_6_38_1 is not set
-# CT_KERNEL_V_2_6_38 is not set
-# CT_KERNEL_V_2_6_37_6 is not set
-# CT_KERNEL_V_2_6_36_4 is not set
-# CT_KERNEL_V_2_6_35_13 is not set
-# CT_KERNEL_V_2_6_34_9 is not set
-# CT_KERNEL_V_2_6_33_12 is not set
-# CT_KERNEL_V_2_6_32_39 is not set
-# CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_58 is not set
-# CT_KERNEL_LINUX_CUSTOM is not set
 CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
@@ -236,29 +196,25 @@ CT_KERNEL_LINUX_INSTALL_CHECK=y
 # Binary utilities
 #
 CT_ARCH_BINFMT_ELF=y
-# CT_ARCH_BINFMT_FLAT is not set
-# CT_ARCH_BINFMT_FDPIC is not set
 
 #
 # GNU binutils
 #
-# CT_BINUTILS_V_2_21 is not set
 # CT_BINUTILS_V_2_20_1 is not set
 CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_19_1 is not set
 # CT_BINUTILS_V_2_19 is not set
 # CT_BINUTILS_V_2_18 is not set
-# CT_BINUTILS_V_2_17 is not set
-# CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
+CT_BINUTILS_2_20_or_later=y
+CT_BINUTILS_2_19_or_later=y
+CT_BINUTILS_2_18_or_later=y
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
+CT_BINUTILS_HAS_PKGVERSION_BUGURL=y
 CT_BINUTILS_LINKER_LD=y
-# CT_BINUTILS_LINKER_GOLD is not set
-# CT_BINUTILS_LINKER_LD_GOLD is not set
-# CT_BINUTILS_LINKER_GOLD_LD is not set
 CT_BINUTILS_LINKERS_LIST="ld"
 CT_BINUTILS_LINKER_DEFAULT="bfd"
-CT_BINUTILS_EXTRA_CONFIG=""
+CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 
 #
 # C compiler
@@ -266,13 +222,6 @@ CT_BINUTILS_EXTRA_CONFIG=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.3"
 CT_CC_gcc=y
-# CT_CC_V_linaro_4_6_2011_04_0 is not set
-# CT_CC_V_4_6_0 is not set
-# CT_CC_V_linaro_4_5_2011_04_0 is not set
-# CT_CC_V_4_5_2 is not set
-# CT_CC_V_4_5_1 is not set
-# CT_CC_V_4_5_0 is not set
-# CT_CC_V_linaro_4_4_2011_02_0 is not set
 # CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
@@ -280,35 +229,23 @@ CT_CC_V_4_4_3=y
 # CT_CC_V_4_4_2 is not set
 # CT_CC_V_4_4_1 is not set
 # CT_CC_V_4_4_0 is not set
+# CT_CC_V_4_3_6 is not set
 # CT_CC_V_4_3_5 is not set
 # CT_CC_V_4_3_4 is not set
 # CT_CC_V_4_3_3 is not set
 # CT_CC_V_4_3_2 is not set
 # CT_CC_V_4_3_1 is not set
 # CT_CC_V_4_2_4 is not set
-# CT_CC_V_4_2_3 is not set
 # CT_CC_V_4_2_2 is not set
-# CT_CC_V_4_2_1 is not set
-# CT_CC_V_4_2_0 is not set
-# CT_CC_V_4_1_2 is not set
-# CT_CC_V_4_0_4 is not set
-# CT_CC_V_3_4_6 is not set
-# CT_CC_GCC_4_2 is not set
 CT_CC_GCC_4_2_or_later=y
-# CT_CC_GCC_4_3 is not set
 CT_CC_GCC_4_3_or_later=y
 CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
-# CT_CC_GCC_4_5 is not set
-# CT_CC_GCC_4_5_or_later is not set
-# CT_CC_GCC_4_6 is not set
-# CT_CC_GCC_4_6_or_later is not set
 CT_CC_GCC_HAS_GRAPHITE=y
-# CT_CC_GCC_HAS_LTO is not set
+CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
-# CT_CC_GCC_USE_MPC is not set
-# CT_CC_GCC_USE_LIBELF is not set
+# CT_CC_LANG_FORTRAN is not set
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -320,17 +257,14 @@ CT_CC_SUPPORT_OBJCXX=y
 # Additional supported languages:
 #
 # CT_CC_LANG_CXX is not set
-# CT_CC_LANG_FORTRAN is not set
 # CT_CC_LANG_JAVA is not set
 
 #
 # gcc other options
 #
-CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
-CT_CC_BUGURL=""
 CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG=""
-CT_CC_EXTRA_CONFIG=""
+CT_CC_CORE_EXTRA_CONFIG_ARRAY=""
+CT_CC_EXTRA_CONFIG_ARRAY=""
 CT_CC_STATIC_LIBSTDCXX=y
 
 #
@@ -359,27 +293,13 @@ CT_CC_GCC_LDBL_128=m
 #
 CT_LIBC="uClibc"
 CT_LIBC_VERSION="0.9.30.3"
-# CT_LIBC_eglibc is not set
-# CT_LIBC_glibc is not set
-# CT_LIBC_mingw is not set
-# CT_LIBC_newlib is not set
-# CT_LIBC_none is not set
 CT_LIBC_uClibc=y
-# CT_LIBC_eglibc_AVAILABLE is not set
-# CT_LIBC_glibc_AVAILABLE is not set
-# CT_LIBC_mingw_AVAILABLE is not set
-# CT_LIBC_newlib_AVAILABLE is not set
-# CT_LIBC_none_AVAILABLE is not set
 CT_LIBC_uClibc_AVAILABLE=y
-# CT_LIBC_UCLIBC_V_0_9_31 is not set
+# CT_LIBC_UCLIBC_V_0_9_32 is not set
 CT_LIBC_UCLIBC_V_0_9_30_3=y
 # CT_LIBC_UCLIBC_V_0_9_30_2 is not set
 # CT_LIBC_UCLIBC_V_0_9_30_1 is not set
 # CT_LIBC_UCLIBC_V_0_9_30 is not set
-# CT_LIBC_UCLIBC_V_0_9_29 is not set
-# CT_LIBC_UCLIBC_V_0_9_28_3 is not set
-# CT_LIBC_UCLIBC_V_snapshot is not set
-# CT_LIBC_UCLIBC_V_specific_date is not set
 CT_LIBC_UCLIBC_0_9_30_or_later=y
 CT_LIBC_UCLIBC_PARALLEL=y
 CT_LIBC_UCLIBC_VERBOSITY_0=y
@@ -392,18 +312,14 @@ CT_LIBC_UCLIBC_DEBUG_LEVEL_0=y
 CT_LIBC_UCLIBC_DEBUG_LEVEL=0
 CT_LIBC_UCLIBC_CONFIG_FILE=""
 CT_LIBC_SUPPORT_THREADS_ANY=y
-# CT_LIBC_SUPPORT_NPTL is not set
 CT_LIBC_SUPPORT_LINUXTHREADS=y
-# CT_LIBC_SUPPORT_WIN32THREADS is not set
 CT_LIBC_SUPPORT_THREADS_NONE=y
 CT_THREADS="linuxthreads"
 
 #
 # Common C library options
 #
-# CT_THREADS_NPTL is not set
 CT_THREADS_LINUXTHREADS=y
-# CT_THREADS_WIN32THREADS is not set
 # CT_THREADS_NONE is not set
 CT_LIBC_XLDD=y
 
@@ -429,34 +345,22 @@ CT_GMP_NEEDED=y
 CT_MPFR_NEEDED=y
 CT_PPL_NEEDED=y
 CT_CLOOG_NEEDED=y
-# CT_MPC_NEEDED is not set
-# CT_LIBELF_NEEDED is not set
 CT_COMPLIBS=y
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
-# CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
 # CT_GMP_V_4_3_1 is not set
 # CT_GMP_V_4_3_0 is not set
-# CT_GMP_V_4_2_4 is not set
-# CT_GMP_V_4_2_2 is not set
 CT_GMP_VERSION="4.3.2"
 # CT_MPFR_V_3_0_0 is not set
 CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_4_1 is not set
 # CT_MPFR_V_2_4_0 is not set
-# CT_MPFR_V_2_3_2 is not set
-# CT_MPFR_V_2_3_1 is not set
 CT_MPFR_VERSION="2.4.2"
-# CT_PPL_V_0_11_2 is not set
-# CT_PPL_V_0_11_1 is not set
-# CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
-# CT_PPL_0_11 is not set
-# CT_PPL_NEEDS_LIBPWL is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
-- 
1.7.2.5
