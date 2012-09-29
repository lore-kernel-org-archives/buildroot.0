From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Sep 2012 09:56:26 +0200
Subject: [Buildroot] [git commit] external-toolchain: add Sourcery CodeBench
	ARM 2012.03
Message-ID: <20120929201756.278DA9975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bcb494dcc21f9f8a2bd32d0f6425bbe2b63f5ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   22 ++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 85b8843..94ae735 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -83,6 +83,27 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
 
 	  To use this toolchain, you must disable soft float usage.
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
+	bool "Sourcery CodeBench ARM 2012.03"
+	depends on BR2_arm
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the ARM architecture, from
+	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
+	  2.15 and gdb 7.2.50, kernel headers 3.2.10. It has support
+	  for the following variants:
+	    - ARMv5TE, little endian, soft-float, glibc
+	      Select ARM926T, ARM10T, XScale or another ARMv5 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv4T, little endian, soft-float, glibc
+	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mthumb
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	bool "Sourcery CodeBench ARM 2011.09"
 	depends on BR2_arm
@@ -620,6 +641,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 5a7c03e..43d747c 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -187,6 +187,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.05/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-2012.05-20120523_linux.tar.bz2
