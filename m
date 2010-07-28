From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 12:10:13 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain: remove multilib
In-Reply-To: <cover.1280311803.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280311803.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3055ee59e84f44dbe36c8c938de3afc10377fb42.1280311803.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supporting multilib is much more than just passing --enable-multilib
to gcc. You have to actually build the C library several times (once
for each multilib variant you want to support in your toolchain), and
to pass MULTILIB_OPTIONS/MULTILIB_EXCEPTIONS values to gcc to let it
know the set of multilib variants you're interested in.

Since we'll probably never support multilib toolchains in Buildroot,
just get rid of this BR2_ENABLE_MULTILIB option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig      |    1 -
 configs/at91rm9200df_defconfig       |    1 -
 configs/at91sam9260dfc_defconfig     |    1 -
 configs/at91sam9260pf_defconfig      |    1 -
 configs/at91sam9261ek_defconfig      |    1 -
 configs/at91sam9263ek_defconfig      |    1 -
 configs/at91sam9g20dfc_defconfig     |    1 -
 configs/atngw100-base_defconfig      |    1 -
 configs/atngw100_defconfig           |    1 -
 configs/atstk1005_defconfig          |    1 -
 configs/atstk100x_defconfig          |    1 -
 configs/i386_defconfig               |    1 -
 configs/i686_defconfig               |    1 -
 configs/integrator926_defconfig      |    1 -
 configs/integrator926_huge_defconfig |    1 -
 configs/kb9202_defconfig             |    1 -
 configs/v100sc2_defconfig            |    1 -
 toolchain/Config.in.2                |    5 -----
 toolchain/Makefile.in                |    6 ------
 toolchain/binutils/binutils.mk       |    2 --
 toolchain/gcc/gcc-uclibc-4.x.mk      |    5 +----
 21 files changed, 1 insertions(+), 34 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 2ac7de3..26a999a 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -284,7 +284,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 # BR2_VFP_FLOAT is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 2a193cf..66a9984 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -299,7 +299,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 BR2_PACKAGE_SSTRIP_TARGET=y
 BR2_PACKAGE_SSTRIP_HOST=y
-# BR2_ENABLE_MULTILIB is not set
 # BR2_VFP_FLOAT is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 98d3401..594b6e8 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -305,7 +305,6 @@ BR2_GDB_VERSION="6.8"
 # BR2_MKLIBS is not set
 BR2_PACKAGE_SSTRIP_TARGET=y
 BR2_PACKAGE_SSTRIP_HOST=y
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index ec4005d..76526c9 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -205,7 +205,6 @@ BR2_CCACHE=y
 #
 BR2_PACKAGE_SSTRIP_TARGET=y
 BR2_PACKAGE_SSTRIP_HOST=y
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 7524c68..9a2de94 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -299,7 +299,6 @@ BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 BR2_PACKAGE_SSTRIP_HOST=y
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 85ccede..99efe17 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -304,7 +304,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 BR2_PACKAGE_SSTRIP_HOST=y
-# BR2_ENABLE_MULTILIB is not set
 # BR2_VFP_FLOAT is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 57d72ae..90b94f1 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -304,7 +304,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 BR2_PACKAGE_SSTRIP_TARGET=y
 BR2_PACKAGE_SSTRIP_HOST=y
-# BR2_ENABLE_MULTILIB is not set
 # BR2_VFP_FLOAT is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 270c056..5d27a22 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -230,7 +230,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 # BR2_CROSS_TOOLCHAIN_TARGET_UTILS is not set
 
 #
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index a78372d..3d6c3f1 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -225,7 +225,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 451e248..aa5af8b 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -244,7 +244,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index e39e608..036321f 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -241,7 +241,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 026e206..8045476 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -240,7 +240,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 884ec7d..a24a53e 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -240,7 +240,6 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 #
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 4ec53f9..ceb80d6 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -226,7 +226,6 @@ BR2_GCC_SHARED_LIBGCC=y
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 # BR2_LARGEFILE is not set
 # BR2_INET_IPV6 is not set
 # BR2_INET_RPC is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index b5c34df..46503ab 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -227,7 +227,6 @@ BR2_GCC_SHARED_LIBGCC=y
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 976f1e9..982949c 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -229,7 +229,6 @@ BR2_GCC_SHARED_LIBGCC=y
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 # BR2_LARGEFILE is not set
 # BR2_INET_IPV6 is not set
 # BR2_INET_RPC is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index b6554c8..952a75b 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -202,7 +202,6 @@ BR2_GDB_VERSION="6.7.1"
 # BR2_MKLIBS is not set
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
-# BR2_ENABLE_MULTILIB is not set
 BR2_LARGEFILE=y
 BR2_INET_IPV6=y
 BR2_INET_RPC=y
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 35263ce..930dd12 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -168,11 +168,6 @@ source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
 
-config BR2_ENABLE_MULTILIB
-	bool "Enable multilib support?"
-	help
-	    Build libraries to support different ABIs.
-
 config BR2_VFP_FLOAT
 	bool "Use ARM Vector Floating Point unit"
 	depends on !BR2_SOFT_FLOAT
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index d1af877..371509f 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -4,12 +4,6 @@ else
 THREADS:=--enable-threads
 endif
 
-ifeq ($(BR2_ENABLE_MULTILIB),y)
-MULTILIB:=--enable-multilib
-else
-MULTILIB:=--disable-multilib
-endif
-
 BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
 BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 93dbbb0..e44707c 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -74,7 +74,6 @@ $(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		$(BR2_CONFIGURE_STAGING_SYSROOT) \
 		$(DISABLE_NLS) \
-		$(MULTILIB) \
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(EXTRA_BINUTILS_CONFIG_OPTIONS) \
@@ -128,7 +127,6 @@ $(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		$(DISABLE_NLS) \
-		$(MULTILIB) \
 		$(BINUTILS_TARGET_CONFIG_OPTIONS) \
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index d9269bd..b87270f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -167,7 +167,7 @@ ifeq ("$(strip $(ARCH))","armeb")
 endif
 endif
 ifeq ($(ARCH)-$(BR2_GCC_SHARED_LIBGCC),powerpc-y)
-ifneq ($(BR2_SOFT_FLOAT)$(BR2_ENABLE_MULTILIB),)
+ifneq ($(BR2_SOFT_FLOAT),)
 	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
 endif
 endif
@@ -206,7 +206,6 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
-		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
@@ -286,7 +285,6 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
-		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
@@ -419,7 +417,6 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 		$(GCC_WITH_TARGET_MPFR) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
-		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
-- 
1.7.0.4
