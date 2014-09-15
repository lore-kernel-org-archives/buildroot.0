From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 23:49:36 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain-external: bump ARM,
	ARMeb and AArch64 Linaro toolchains to 14.08
In-Reply-To: <1410817776-30133-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410817776-30133-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410817776-30133-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 14 +++++++-------
 toolchain/toolchain-external/toolchain-external.mk | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9006827..67ad450 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -7,7 +7,7 @@ comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2014.05"
+	bool "Linaro ARM 2014.08"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -20,8 +20,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2014.05 (based on gcc 4.9), Linaro GDB 2014.05 (based on
-	  GDB 7.6), eglibc 2.19, Binutils 2014.05 (based on 2.24). It
+	  GCC 2014.08 (based on gcc 4.9), Linaro GDB 2013.10 (based on
+	  GDB 7.6), eglibc 2.19, Binutils 2014.08 (based on 2.24). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
@@ -33,7 +33,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2014.04"
+	bool "Linaro armeb 2014.08"
 	depends on BR2_armeb
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -46,8 +46,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2014.04 (based on gcc 4.8), Linaro GDB
-	  2014.04 (based on GDB 7.6), eglibc 2.19, Binutils 2014.04
+	  uses Linaro GCC 2014.08 (based on gcc 4.9), Linaro GDB
+	  2013.10 (based on GDB 7.6), eglibc 2.19, Binutils 2014.08
 	  (based on 2.24). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
@@ -815,7 +815,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  http://wiki.xilinx.com/mb-gnu-tools
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 14.05"
+	bool "Linaro AArch64 14.08"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7012e12..78c2273 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -276,12 +276,12 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.05/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.05_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.08/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.08_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.04/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.8-2014.04_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.08/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.08_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
@@ -357,8 +357,8 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.05/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.05_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.08/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.08_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu/
-- 
2.0.0
