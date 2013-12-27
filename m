From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 12:32:19 +0100
Subject: [Buildroot] [PATCH 3/6] toolchain-external: update Linaro ARM
	toolchains
In-Reply-To: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388143942-1187-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Linaro ARM 2013.10 and Linaro ARM 2013.11, and remove Linaro ARM
2013.07 and Linaro ARM 2013.08.

The main change for those versions is the switch to eglibc 2.18.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 26 +++++++++++-----------
 toolchain/toolchain-external/toolchain-external.mk | 16 ++++++-------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d6d1960..e32a16e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,8 +6,8 @@ choice
 comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_PREFER_STATIC_LIB
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
-	bool "Linaro 2013.09"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
+	bool "Linaro 2013.11"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -19,8 +19,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.09 (based on gcc 4.8), Linaro GDB 2013.05 (based on
-	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
+	  GCC 2013.11 (based on gcc 4.8), Linaro GDB 2013.10 (based on
+	  GDB 7.6), eglibc 2.18, Binutils 2013.10 (based on 2.23). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
@@ -28,8 +28,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
-	bool "Linaro 2013.08"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
+	bool "Linaro 2013.10"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -41,8 +41,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.08 (based on gcc 4.8), Linaro GDB 2013.05 (based on
-	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
+	  GCC 2013.10 (based on gcc 4.8), Linaro GDB 2013.10 (based on
+	  GDB 7.6), eglibc 2.18, Binutils 2013.10 (based on 2.23). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
@@ -50,8 +50,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
-	bool "Linaro 2013.07"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
+	bool "Linaro 2013.09"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -63,7 +63,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.07 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GCC 2013.09 (based on gcc 4.8), Linaro GDB 2013.05 (based on
 	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
@@ -836,9 +836,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 64c4d0b..0e12c76 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -265,18 +265,18 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux.tar.xz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.08_linux.tar.xz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.09/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.10/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.11/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.11_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.8.3.2
