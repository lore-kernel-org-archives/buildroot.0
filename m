From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Sep 2012 09:54:34 +0200
Subject: [Buildroot] [git commit] toolchain-external: add linaro 2012.0{7, 8,
	9}
Message-ID: <20120929201755.ABCE39975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=820cf3715248f26de533ccd6b6bc178142f69814
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And remove the 2012.0{2,3,4} versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   70 ++++++++++++++++--------------
 toolchain/toolchain-external/ext-tool.mk |   18 ++++----
 2 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f86ed74..85b8843 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,79 +3,85 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06
-	bool "Linaro 2012.06"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
+	bool "Linaro 2012.09"
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.06 (based on gcc 4.7), Linaro GDB 2012.06 (based on
-	  GDB 7.4), eglibc 2.15. It generates code that runs on all
+	  GCC 2012.09 (based on gcc 4.7), Linaro GDB 2012.09 (based on
+	  GDB 7.5), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
 	  calling convention, and uses the VFPv3-D16 FPU instructions.
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
-	bool "Linaro 2012.05"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
+	bool "Linaro 2012.08"
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.05 (based on gcc 4.7), Linaro GDB 2012.05 (based on
-	  GDB 7.4), eglibc 2.13. It generates code that runs on all
+	  GCC 2012.08 (based on gcc 4.7), Linaro GDB 2012.06 (based on
+	  GDB 7.4), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
 	  code generated is Thumb 2, with the hard floating point
 	  calling convention, and uses the VFPv3-D16 FPU instructions.
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
-	bool "Linaro 2012.04"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_07
+	bool "Linaro 2012.07"
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.04 (based on gcc 4.7), Linaro GDB 2012.04 (based on
-	  GDB 7.4), eglibc 2.13. It generates code that runs on all
+	  GCC 2012.07 (based on gcc 4.7), Linaro GDB 2012.06 (based on
+	  GDB 7.4), eglibc 2.15. It generates code that runs on all
 	  Cortex-A profile devices, but tuned for the Cortex-A9. The
-	  code generated is Thumb 2, with the softfp calling
-	  convention, and uses the VFPv3-D16 FPU instructions.
+	  code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03
-	bool "Linaro 2012.03"
+	  To use this toolchain, you must disable soft float usage.
+
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06
+	bool "Linaro 2012.06"
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.03 (based on gcc 4.6), Linaro GDB 2012.03, eglibc
-	  2.13. It generates code that runs on all Cortex-A profile
-	  devices, but tuned for the Cortex-A9. The code generated is
-	  Thumb 2, with the softfp calling convention, and uses the
-	  VFPv3-D16 FPU instructions.
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
-	bool "Linaro 2012.02"
+	  GCC 2012.06 (based on gcc 4.7), Linaro GDB 2012.06 (based on
+	  GDB 7.4), eglibc 2.15. It generates code that runs on all
+	  Cortex-A profile devices, but tuned for the Cortex-A9. The
+	  code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
+
+	  To use this toolchain, you must disable soft float usage.
+
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
+	bool "Linaro 2012.05"
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.02 (based on gcc 4.6), Linaro GDB 2012.02, eglibc
-	  2.13. It generates code that runs on all Cortex-A profile
-	  devices, but tuned for the Cortex-A9. The code generated is
-	  Thumb 2, with the softfp calling convention, and uses the
-	  VFPv3-D16 FPU instructions.
+	  GCC 2012.05 (based on gcc 4.7), Linaro GDB 2012.05 (based on
+	  GDB 7.4), eglibc 2.13. It generates code that runs on all
+	  Cortex-A profile devices, but tuned for the Cortex-A9. The
+	  code generated is Thumb 2, with the hard floating point
+	  calling convention, and uses the VFPv3-D16 FPU instructions.
+
+	  To use this toolchain, you must disable soft float usage.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	bool "Sourcery CodeBench ARM 2011.09"
@@ -605,11 +611,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
-	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03
-	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_07
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 53b898f..5a7c03e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -187,21 +187,21 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02),y)
-TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.02/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.02-20120222_linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03),y)
-TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.03/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04),y)
-TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.04/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.04-20120426_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.05/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.05-20120523_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.06/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.06-20120625_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_07),y)
+TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.07/+download/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.07-20120720_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08),y)
+TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.08/+download/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.08-20120827_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09),y)
+TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.09/+download/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.09-20120921_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
