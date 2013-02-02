From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Feb 2013 14:46:21 +0100
Subject: [Buildroot] [PATCH 2/4] toolchain-external: remove support for ARM
	Linaro 2012.10 toolchain
In-Reply-To: <1359812783-22866-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1359812783-22866-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1359812783-22866-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   20 --------------------
 toolchain/toolchain-external/ext-tool.mk |    3 ---
 2 files changed, 23 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a3f254c..fb994b8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -60,25 +60,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
-	bool "Linaro 2012.10"
-	depends on BR2_arm
-	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.10 (based on gcc 4.7), Linaro GDB 2012.10 (based on
-	  GDB 7.5), eglibc 2.15. It generates code that runs on all
-	  Cortex-A profile devices, but tuned for the Cortex-A9. The
-	  code generated is Thumb 2, with the hard floating point
-	  calling convention, and uses the VFPv3-D16 FPU instructions.
-
-	  To use this toolchain, you must disable soft float usage.
-
 comment "Linaro toolchains available for Cortex-A{5,8,9,15}"
 	depends on BR2_arm
 	depends on !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15
@@ -753,7 +734,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_01
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index bfb1687..f083edb 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -184,9 +184,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10),y)
-TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.10/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.11/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux.tar.bz2
-- 
1.7.9.5
