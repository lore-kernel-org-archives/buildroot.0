From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 00:01:36 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump Linaro ARM
	toolchains to 2013.04 and 2013.05
Message-ID: <20130611100806.937AF9A178@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea25177384368531ed269033984a2925b54f4e79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We add support for Linaro 2013.04 and Linaro 2013.05 and remove
support for Linaro 2013.01 and Linaro 2013.02.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   24 ++++++++++++------------
 toolchain/toolchain-external/ext-tool.mk |   12 ++++++------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 37c5648..6a58e0f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,8 +3,8 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
-	bool "Linaro 2013.03"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
+	bool "Linaro 2013.05"
 	depends on BR2_arm
 	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -14,16 +14,16 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.03 (based on gcc 4.7), Linaro GDB 2012.12 (based on
-	  GDB 7.5), eglibc 2.15. It generates code that runs on all
+	  GCC 2013.05 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GDB 7.6), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
 	  calling convention, and uses the VFPv3-D16 FPU instructions.
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02
-	bool "Linaro 2013.02"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
+	bool "Linaro 2013.04"
 	depends on BR2_arm
 	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -33,7 +33,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.02 (based on gcc 4.7), Linaro GDB 2012.12 (based on
+	  GCC 2013.04 (based on gcc 4.7), Linaro GDB 2012.12 (based on
 	  GDB 7.5), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
@@ -41,8 +41,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
-	bool "Linaro 2013.01"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
+	bool "Linaro 2013.03"
 	depends on BR2_arm
 	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -52,7 +52,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.01 (based on gcc 4.7), Linaro GDB 2012.12 (based on
+	  GCC 2013.03 (based on gcc 4.7), Linaro GDB 2012.12 (based on
 	  GDB 7.5), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
@@ -741,9 +741,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 218ef07..93aec83 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -200,15 +200,15 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01),y)
-TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2013.01/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.02/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.02-01-20130221_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03),y)
 TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.04/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.05/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.8-2013.05_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
