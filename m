From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Nov 2012 15:07:02 +0100
Subject: [Buildroot] [PATCH for-next 2/3] toolchain-external: remove Linaro
	2012.08
In-Reply-To: <1354025223-14474-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1354025223-14474-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1354025223-14474-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   18 ------------------
 toolchain/toolchain-external/ext-tool.mk |    3 ---
 2 files changed, 21 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 56630fa..469c283 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -54,23 +54,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
-	bool "Linaro 2012.08"
-	depends on BR2_arm
-	depends on BR2_cortex_a8 || BR2_cortex_a9
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.08 (based on gcc 4.7), Linaro GDB 2012.06 (based on
-	  GDB 7.4), eglibc 2.15. It generates code that runs on all
-	  Cortex-A profile devices, but tuned for the Cortex-A9. The
-	  code generated is Thumb 2, with the hard floating point
-	  calling convention, and uses the VFPv3-D16 FPU instructions.
-
-	  To use this toolchain, you must disable soft float usage.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	bool "Sourcery CodeBench ARM 2012.03"
 	depends on BR2_arm
@@ -641,7 +624,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index d98fcc6..4429480 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -184,9 +184,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08),y)
-TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.08/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.08-20120827_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.09/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.09-20120921_linux.tar.bz2
-- 
1.7.9.5
