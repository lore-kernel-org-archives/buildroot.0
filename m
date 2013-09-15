From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 23:28:17 +0200
Subject: [Buildroot] [git commit] toolchain: update Linaro ARM external
	toolchains
Message-ID: <20130915213314.DD5DA82A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2281fe95ca4aea1ceea73aba25dc8467c9145bb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   49 ++++++++++++++++--------------
 toolchain/toolchain-external/ext-tool.mk |   12 ++++----
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8e25aa3..11658dd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,8 +3,8 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
-	bool "Linaro 2013.06"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
+	bool "Linaro 2013.08"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -15,16 +15,17 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.06 (based on gcc 4.8), Linaro GDB 2013.06 (based on
-	  GDB 7.6), eglibc 2.15. It generates code that runs on all
-	  Cortex-A profile devices, but tuned for the Cortex-A9. The
-	  code generated is Thumb 2, with the hard floating point
-	  calling convention, and uses the VFPv3-D16 FPU instructions.
+	  GCC 2013.08 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
+	  generates code that runs on all Cortex-A profile devices,
+	  but tuned for the Cortex-A9. The code generated is Thumb 2,
+	  with the hard floating point calling convention, and uses
+	  the VFPv3-D16 FPU instructions.
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
-	bool "Linaro 2013.05"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
+	bool "Linaro 2013.07"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -35,16 +36,17 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.05 (based on gcc 4.8), Linaro GDB 2013.05 (based on
-	  GDB 7.6), eglibc 2.15. It generates code that runs on all
-	  Cortex-A profile devices, but tuned for the Cortex-A9. The
-	  code generated is Thumb 2, with the hard floating point
-	  calling convention, and uses the VFPv3-D16 FPU instructions.
+	  GCC 2013.07 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
+	  generates code that runs on all Cortex-A profile devices,
+	  but tuned for the Cortex-A9. The code generated is Thumb 2,
+	  with the hard floating point calling convention, and uses
+	  the VFPv3-D16 FPU instructions.
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
-	bool "Linaro 2013.04"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
+	bool "Linaro 2013.06"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -55,11 +57,12 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.04 (based on gcc 4.7), Linaro GDB 2012.12 (based on
-	  GDB 7.5), eglibc 2.15. It generates code that runs on all
-	  Cortex-A profile devices, but tuned for the Cortex-A9. The
-	  code generated is Thumb 2, with the hard floating point
-	  calling convention, and uses the VFPv3-D16 FPU instructions.
+	  GCC 2013.06 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
+	  generates code that runs on all Cortex-A profile devices,
+	  but tuned for the Cortex-A9. The code generated is Thumb 2,
+	  with the hard floating point calling convention, and uses
+	  the VFPv3-D16 FPU instructions.
 
 	  To use this toolchain, you must disable soft float usage.
 
@@ -813,9 +816,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index d5023cf..6a8d8a6 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -229,15 +229,15 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
 	rm -rf $(@D)/arago-2011.09/
 endef
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.04/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.05/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.05_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06),y)
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.08_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
