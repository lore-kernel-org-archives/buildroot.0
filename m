From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Jun 2013 16:20:02 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external: bump to Linaro ARM
	2013.06
Message-ID: <1371997203-27475-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   | 22 +++++++++++-----------
 toolchain/toolchain-external/ext-tool.mk |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 94b8158..ebe9fcd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,8 +3,8 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
-	bool "Linaro 2013.05"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
+	bool "Linaro 2013.06"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.05 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GCC 2013.06 (based on gcc 4.8), Linaro GDB 2013.06 (based on
 	  GDB 7.6), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
@@ -22,8 +22,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
-	bool "Linaro 2013.04"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
+	bool "Linaro 2013.05"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -33,16 +33,16 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.04 (based on gcc 4.7), Linaro GDB 2012.12 (based on
-	  GDB 7.5), eglibc 2.15. It generates code that runs on all
+	  GCC 2013.05 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GDB 7.6), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
 	  calling convention, and uses the VFPv3-D16 FPU instructions.
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
-	bool "Linaro 2013.03"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
+	bool "Linaro 2013.04"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -52,7 +52,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.03 (based on gcc 4.7), Linaro GDB 2012.12 (based on
+	  GCC 2013.04 (based on gcc 4.7), Linaro GDB 2012.12 (based on
 	  GDB 7.5), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
@@ -777,9 +777,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index e5dc8ed..2b0b23e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -218,15 +218,15 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
 	rm -rf $(@D)/arago-2011.09/
 endef
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04),y)
 TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.04/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05),y)
 TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.05/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.8-2013.05_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.06/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.8.1.2
