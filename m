From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 17:17:02 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: remove
	Linaro 2012.01
Message-ID: <20120802195258.6D5F28E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d1fd3affbaec495ce4b046bb6e3826f2d3c25f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   15 ---------------
 toolchain/toolchain-external/ext-tool.mk |    3 ---
 2 files changed, 0 insertions(+), 18 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2b2e763..835763a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -77,20 +77,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
 	  Thumb 2, with the softfp calling convention, and uses the
 	  VFPv3-D16 FPU instructions.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01
-	bool "Linaro 2012.01"
-	depends on BR2_arm
-	depends on BR2_cortex_a8 || BR2_cortex_a9
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.01 (based on gcc 4.6), Linaro GDB 2011.12, eglibc
-	  2.13. It generates code that runs on all Cortex-A profile
-	  devices, but tuned for the Cortex-A9. The code generated is
-	  Thumb 2, with the softfp calling convention, and uses the
-	  VFPv3-D16 FPU instructions.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	bool "Sourcery CodeBench ARM 2011.09"
 	depends on BR2_arm
@@ -562,7 +548,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_03
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_04
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index e0515f1..35fcb7b 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -190,9 +190,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01),y)
-TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.01/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.01-20120125_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02),y)
 TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.02/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.02-20120222_linux.tar.bz2
