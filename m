From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Sep 2015 23:45:50 +0200
Subject: [Buildroot] [PATCH 2/5] toolchain/external: rename Linaro arm and
	AArch64 options
In-Reply-To: <cover.1442785491.git.yann.morin.1998@free.fr>
References: <cover.1442785491.git.yann.morin.1998@free.fr>
Message-ID: <86fd4e995ad6ec4737cdd0b0c3a5c4c0f9a0123a.1442785491.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're going to add a new Linaro version (2015.02) for those toolchains,
so we want to differentiate them.

Even though we could simply keep the current options as-is and just
introduce the new ones suffixed with the version, it is better to rename
the existing options for consistency with the new ones and wiith other
multi-versions toolchains (like the CS CodeBench).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   | 30 ++++++++++++++++++++++
 toolchain/toolchain-external/Config.in             | 12 ++++-----
 toolchain/toolchain-external/toolchain-external.mk |  6 ++---
 3 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 18231fd..fbe70fb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,36 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+	bool "External Linaro arm 2014.09 toolchain option renamed"
+	select BR2_LEGACY
+	help
+	  The external Linaro ARM 2014.09 toolchain option has been
+	  renamed to BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_09.
+
+	  Please review the toolchain version used in the toolchain
+	  choice, located in the Toolchain sub-menu.
+
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+	bool "External Linaro armeb 2014.09 toolchain option renamed"
+	select BR2_LEGACY
+	help
+	  The external Linaro ARM 2014.09 toolchain option has been
+	  renamed to BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_09.
+
+	  Please review the toolchain version used in the toolchain
+	  choice, located in the Toolchain sub-menu.
+
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+	bool "External Linaro AArch64 14.09 toolchain option renamed"
+	select BR2_LEGACY
+	help
+	  The external Linaro AArch64 14.09 toolchain option has been
+	  renamed to BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_09.
+
+	  Please review the toolchain version used in the toolchain
+	  choice, located in the Toolchain sub-menu.
+
 config BR2_PACKAGE_BLACKBOX
 	bool "blackbox package has been removed"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0897192..941ab0e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -11,7 +11,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_09
 	bool "Linaro ARM 2014.09"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
@@ -33,7 +33,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_09
 	bool "Linaro armeb 2014.09"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
@@ -804,7 +804,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_09
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -929,14 +929,14 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arceb
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_09
+	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_09
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_09
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 61a5dba..fd9b68a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -307,11 +307,11 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
@@ -374,7 +374,7 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
-- 
1.9.1
