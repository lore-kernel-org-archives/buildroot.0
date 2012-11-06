From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:19 +0100
Subject: [Buildroot] [git commit] toolchain-external: remove Linaro 2012.06
Message-ID: <20121106072431.E2C43998E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0da625e2ff695c2b0aacf2813b18ee3b4552dcf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   18 ------------------
 toolchain/toolchain-external/ext-tool.mk |    3 ---
 2 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 286fe29..03caf04 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -71,23 +71,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_07
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06
-	bool "Linaro 2012.06"
-	depends on BR2_arm
-	depends on BR2_cortex_a8 || BR2_cortex_a9
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2012.06 (based on gcc 4.7), Linaro GDB 2012.06 (based on
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
@@ -658,7 +641,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_07
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index d81e0c6..7761534 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -184,9 +184,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06),y)
-TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.06/+download/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.06-20120625_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_07),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.07/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.07-20120720_linux.tar.bz2
