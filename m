From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:19 +0100
Subject: [Buildroot] [git commit] toolchain-external: remove Sourcery
	CodeBench ARM 2010q1
Message-ID: <20121106072430.AF080998E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b3fba22d752100445cb734b310f744b551c6a27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   23 -----------------------
 toolchain/toolchain-external/ext-tool.mk |    5 +----
 2 files changed, 1 insertions(+), 27 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 882c04a..68b68ff 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -176,28 +176,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
-	bool "Sourcery CodeBench ARM 2010q1"
-	depends on BR2_arm
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
-	  2.11, gdb 7.0.50 and kernel headers 2.6.32. It has support
-	  for the following variants:
-	     - ARMv5T, little endian, soft-float, glibc
-	       Select ARM926T, ARM10T, XScale or another ARMv5 core
-	       Select BR2_SOFT_FLOAT
-	     - ARMv4T, little endian, soft-float, glibc
-	       Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-	       Select BR2_SOFT_FLOAT
-	     - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-	       Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-	       Select BR2_SOFT_FLOAT
-	       Set BR2_TARGET_OPTIMIZATION to -mthumb
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	bool "Sourcery CodeBench MIPS 2011.09"
 	depends on BR2_mips || BR2_mipsel
@@ -749,7 +727,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
-	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 429ff86..292f698 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -175,10 +175,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE=arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package7851/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2010.09-50-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
