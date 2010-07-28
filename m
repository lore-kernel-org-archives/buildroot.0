From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 23:21:45 +0200
Subject: [Buildroot] [git commit master 1/1] gcc: remove option on SJLJ
	exceptions
Message-ID: <20100729065330.D393E82943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d4a992e2b817cc14276c68e0321edaf66450cf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a very advanced option, and it seems, according to
http://choices.cs.uiuc.edu/exceptions.pdf that SJLJ exceptions aren't
really interesting.

Users really interested by this can always use the
BR2_EXTRA_GCC_CONFIG_OPTIONS is they want.

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
 toolchain/gcc/Config.in              |    8 --------
 toolchain/gcc/Makefile.in            |    4 ----
 toolchain/gcc/gcc-uclibc-4.x.mk      |    2 --
 20 files changed, 0 insertions(+), 31 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 3062541..2ac7de3 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -245,7 +245,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_CROSS_FORTRAN is not set
 # BR2_INSTALL_LIBGCJ is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 98158b9..2a193cf 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -250,7 +250,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_CROSS_FORTRAN is not set
 # BR2_INSTALL_LIBGCJ is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index f1d63df..98d3401 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -267,7 +267,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 651041f..ec4005d 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -173,7 +173,6 @@ BR2_GCC_VERSION_4_2_1=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_VERSION="4.2.1"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 0d2fa0b..7524c68 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -270,7 +270,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 6b4f592..85ccede 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -264,7 +264,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_CROSS_FORTRAN is not set
 # BR2_INSTALL_LIBGCJ is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 92171d5..57d72ae 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -264,7 +264,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_CROSS_FORTRAN is not set
 # BR2_INSTALL_LIBGCJ is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index f5eba61..270c056 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -196,7 +196,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2-avr32-2.1.5"
 # BR2_TOOLCHAIN_SYSROOT is not set
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_SHARED_LIBGCC is not set
 
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index d1db2da..a78372d 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -174,7 +174,6 @@ BR2_GCC_VERSION_4_2_2_AVR32_2_1_5=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_VERSION="4.2.2-avr32-2.1.5"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_SHARED_LIBGCC=y
 BR2_GCC_ENABLE_TLS=y
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index b90761b..451e248 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -200,7 +200,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2-avr32-2.1.5"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_SHARED_LIBGCC=y
 
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index c12ccf8..e39e608 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -195,7 +195,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2-avr32-2.1.5"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_SHARED_LIBGCC=y
 
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 65825be..026e206 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -195,7 +195,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.4.0"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_CROSS_FORTRAN is not set
 # BR2_INSTALL_LIBGCJ is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 31ce604..884ec7d 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -195,7 +195,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.4.0"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_CROSS_FORTRAN is not set
 # BR2_INSTALL_LIBGCJ is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 2eb22c5..4ec53f9 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -199,7 +199,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 # BR2_GCC_CROSS_CXX is not set
 # BR2_GCC_CROSS_FORTRAN is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index e44ac5f..b5c34df 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -199,7 +199,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 40c6d18..1d0aa61 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -201,7 +201,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.4"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
 # BR2_GCC_CROSS_FORTRAN is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index ca261ee..5ba2899 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -170,7 +170,6 @@ BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
-# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 31eba6b..cbdc026 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -68,14 +68,6 @@ config BR2_GCC_VERSION
 	default "4.4.4"     if BR2_GCC_VERSION_4_4_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
-config BR2_GCC_USE_SJLJ_EXCEPTIONS
-	bool "Enable setjmp/longjmp exceptions?"
-	help
-	  For some platforms, proper stack unwinding works perfectly,
-	  while other platforms must use setjmp/longjmp exceptions for
-	  proper stack unwinding during exception handling.  Most people
-	  can leave this set to n.
-
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
 	default ""
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index 9537e9d..b6ebca9 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -13,10 +13,6 @@ else
 GCC_SNAP_DATE:=
 endif
 
-ifeq ($(BR2_GCC_USE_SJLJ_EXCEPTIONS),y)
-GCC_USE_SJLJ_EXCEPTIONS:=--enable-sjlj-exceptions
-endif
-
 ifeq ($(BR2_SOFT_FLOAT),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
 ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index dfc1790..d9269bd 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -290,7 +290,6 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
-		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC2_CONFIG_OPTIONS) \
@@ -424,7 +423,6 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
-		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
-- 
1.7.1
