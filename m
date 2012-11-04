From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 18:34:24 +0100
Subject: [Buildroot] [PATCH 16/21] toolchain-external: remove Sourcery
	CodeBench ARM 2010.09
In-Reply-To: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6d175cf12de81570874475c69eea26f785852bf6.1352050008.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   23 -----------------------
 toolchain/toolchain-external/ext-tool.mk |    5 +----
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 68b68ff..cbee8c1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -154,28 +154,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
-	bool "Sourcery CodeBench ARM 2010.09"
-	depends on BR2_arm
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.5.1, binutils 2.20, glibc
-	  2.11 and gdb 7.2.50, kernel headers 2.6.35.2. It has support
-	  for the following variants:
-	    - ARMv5TE, little endian, soft-float, glibc
-	      Select ARM926T, ARM10T, XScale or another ARMv5 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv4T, little endian, soft-float, glibc
-	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mthumb
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	bool "Sourcery CodeBench MIPS 2011.09"
 	depends on BR2_mips || BR2_mipsel
@@ -727,7 +705,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
-	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 292f698..9206cfa 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -175,10 +175,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package7851/public/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE=arm-2010.09-50-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package8739/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
-- 
1.7.9.5
