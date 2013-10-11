From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 11 Oct 2013 09:33:17 -0500
Subject: [Buildroot] [PATCH 2/5] gcc: add microblaze internal toolchain
In-Reply-To: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
References: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1381502000-1995-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gcc/Config.in.host |   23 +++++++++++++++--------
 package/gcc/gcc.mk         |   12 +++++++++---
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 32c668a..267e7a5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -14,6 +14,7 @@ choice
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
+	default BR2_GCC_VERSION_4_9_MICROBLAZE if BR2_microblaze
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
 	default BR2_GCC_VERSION_4_7_X
 	help
@@ -25,13 +26,13 @@ choice
 		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
 		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -40,7 +41,7 @@ choice
 		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -48,18 +49,18 @@ choice
 		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
@@ -68,8 +69,13 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8-arc"
 
+	config BR2_GCC_VERSION_4_9_MICROBLAZE
+		depends on BR2_microblaze
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.9-microblaze"
+
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
@@ -102,6 +108,7 @@ config BR2_GCC_VERSION
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
 	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
+	default "4.9-microblaze" if BR2_GCC_VERSION_4_9_MICROBLAZE
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
@@ -154,7 +161,7 @@ config BR2_GCC_ENABLE_TLS
 
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
-	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc
+	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc && !BR2_microblaze
 	help
 	  Enable OpenMP support for the compiler
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 0c0cc99..9851386 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -17,15 +17,21 @@ endif
 
 ifneq ($(GCC_SNAP_DATE),)
 GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot/
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
 GCC_SITE = $(BR2_ARC_SITE)
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+else ifeq ($(findstring microblaze,$(GCC_VERSION)),microblaze)
+MBGCC_VERSION = b93bb009e021aba64dd4b8cdb0bbc5a176c55543
+GCC_SITE = http://github.com/Xilinx/gcc/tarball/$(MBGCC_VERSION)
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-endif
-
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+endif
 
 #
 # Xtensa special hook
@@ -58,7 +64,7 @@ endef
 #
 
 define HOST_GCC_EXTRACT_CMDS
-	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
+	$(call suitable-extractor,$(GCC_SOURCE),$(BZCAT)) $(DL_DIR)/$(GCC_SOURCE) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
 		--exclude='libjava/*' \
 		--exclude='libgo/*' \
-- 
1.7.1
