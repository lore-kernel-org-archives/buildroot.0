From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:07:57 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump Linaro ARM
	toolchains
Message-ID: <20140414211059.E7E5D9C601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2c54e603c70246b2daadd7c1a151aceb9494ee4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |   30 ++++++++++----------
 toolchain/toolchain-external/toolchain-external.mk |   18 ++++++------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7fb3175..2425d63 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,8 +6,8 @@ choice
 comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_PREFER_STATIC_LIB
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
-	bool "Linaro 2013.11"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
+	bool "Linaro 2014.02"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -21,8 +21,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.11 (based on gcc 4.8), Linaro GDB 2013.10 (based on
-	  GDB 7.6), eglibc 2.18, Binutils 2013.10 (based on 2.23). It
+	  GCC 2014.02 (based on gcc 4.8), Linaro GDB 2013.10 (based on
+	  GDB 7.6), eglibc 2.18, Binutils 2014.02 (based on 2.24). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
@@ -30,8 +30,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
-	bool "Linaro 2013.10"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
+	bool "Linaro 2014.01"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -45,8 +45,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.10 (based on gcc 4.8), Linaro GDB 2013.10 (based on
-	  GDB 7.6), eglibc 2.18, Binutils 2013.10 (based on 2.23). It
+	  GCC 2014.01 (based on gcc 4.8), Linaro GDB 2013.10 (based on
+	  GDB 7.6), eglibc 2.18, Binutils 2013.11 (based on 2.24). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
@@ -54,8 +54,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
-	bool "Linaro 2013.09"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
+	bool "Linaro 2013.12"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -69,8 +69,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.09 (based on gcc 4.8), Linaro GDB 2013.05 (based on
-	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
+	  GCC 2013.12 (based on gcc 4.8), Linaro GDB 2013.10 (based on
+	  GDB 7.6), eglibc 2.18, Binutils 2013.11 (based on 2.24). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
@@ -897,9 +897,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2309e9f..5843bc0 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -270,17 +270,17 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.09/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.09_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.12/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.12_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.10/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.01/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2014.01_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.11/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.11_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
