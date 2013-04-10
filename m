From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Apr 2013 11:48:33 +0200
Subject: [Buildroot] [git commit] toolchain-external: update ARM Linaro
	toolchains
Message-ID: <20130410095125.015D69B53B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79828fc01d92cee84f8703d25f72121f52880ee9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the ARM Linaro toolchains 2013.02 and 2013.03, remove 2012.11 and
2012.12.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   22 +++++++++++-----------
 toolchain/toolchain-external/ext-tool.mk |   14 +++++++-------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2f3926..8dcbc6d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,8 +3,8 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
-	bool "Linaro 2013.01"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
+	bool "Linaro 2013.03"
 	depends on BR2_arm
 	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.01 (based on gcc 4.7), Linaro GDB 2012.12 (based on
+	  GCC 2013.03 (based on gcc 4.7), Linaro GDB 2012.12 (based on
 	  GDB 7.5), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
@@ -22,8 +22,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
-	bool "Linaro 2012.12"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02
+	bool "Linaro 2013.02"
 	depends on BR2_arm
 	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -33,7 +33,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.12 (based on gcc 4.7), Linaro GDB 2012.12 (based on
+	  GCC 2013.02 (based on gcc 4.7), Linaro GDB 2012.12 (based on
 	  GDB 7.5), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
@@ -41,8 +41,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
-	bool "Linaro 2012.11"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
+	bool "Linaro 2013.01"
 	depends on BR2_arm
 	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -52,7 +52,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.11 (based on gcc 4.7), Linaro GDB 2012.10 (based on
+	  GCC 2013.01 (based on gcc 4.7), Linaro GDB 2012.12 (based on
 	  GDB 7.5), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
@@ -758,9 +758,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 5f467b7..6d9a706 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -192,15 +192,15 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11),y)
-TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.11/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12),y)
-TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.12/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.12-20121214_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2013.01/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux.tar.bz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_02),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.02/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.02-01-20130221_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.09-75-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
