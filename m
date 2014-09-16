From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:14:12 +0200
Subject: [Buildroot] [git commit] toolchain-external: remove CodeSourcery
	ARM 2012.03, add 2014.05
Message-ID: <20140916201651.BD9519D6B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93f3c04a91934fe8a165c870e18ecafffd6dbd25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in             |   38 ++++++++++----------
 toolchain/toolchain-external/toolchain-external.mk |    8 ++--
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 640efcc..9006827 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -58,23 +58,21 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
-	bool "Sourcery CodeBench ARM 2013.11"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
+	bool "Sourcery CodeBench ARM 2014.05"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	depends on !BR2_PREFER_STATIC_LIB
-	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.8.1
-	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # based-on gcc-4.8.1
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
-	  2.18 and gdb 7.6.50, kernel headers 3.11. It has support
+	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
+	  2.18 and gdb 7.7.50, kernel headers 3.13. It has support
 	  for the following variants:
 	    - ARMv5TE, little endian, soft-float, glibc
 	      Select ARM926T, ARM10T, XScale or another ARMv5 core
@@ -87,22 +85,23 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
-	bool "Sourcery CodeBench ARM 2013.05"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
+	bool "Sourcery CodeBench ARM 2013.11"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	depends on !BR2_PREFER_STATIC_LIB
-	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.7.3
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.8.1
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # based-on gcc-4.8.1
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
-	  2.17 and gdb 7.4.50, kernel headers 3.8.2. It has support
+	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
+	  2.18 and gdb 7.6.50, kernel headers 3.11. It has support
 	  for the following variants:
 	    - ARMv5TE, little endian, soft-float, glibc
 	      Select ARM926T, ARM10T, XScale or another ARMv5 core
@@ -115,21 +114,22 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
-	bool "Sourcery CodeBench ARM 2012.03"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
+	bool "Sourcery CodeBench ARM 2013.05"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # based-on gcc-4.7.3
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
-	  2.15 and gdb 7.2.50, kernel headers 3.2.10. It has support
+	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
+	  2.17 and gdb 7.4.50, kernel headers 3.8.2. It has support
 	  for the following variants:
 	    - ARMv5TE, little endian, soft-float, glibc
 	      Select ARM926T, ARM10T, XScale or another ARMv5 core
@@ -915,9 +915,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
+	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7d5e224..7012e12 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -252,15 +252,15 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -sf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE = arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.11-33-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405),y)
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE = arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
