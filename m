From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:28 +0200
Subject: [Buildroot] [PATCHv2 18/21] toolchain-external: update Linaro ARM
	toolchain
In-Reply-To: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381069171-29748-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 20 ++++++++++----------
 toolchain/toolchain-external/toolchain-external.mk |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 67f4fc7..ecfe17c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,8 +3,8 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
-	bool "Linaro 2013.08"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
+	bool "Linaro 2013.09"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -15,7 +15,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.08 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GCC 2013.09 (based on gcc 4.8), Linaro GDB 2013.05 (based on
 	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
@@ -24,8 +24,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
-	bool "Linaro 2013.07"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
+	bool "Linaro 2013.08"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -36,7 +36,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.07 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GCC 2013.08 (based on gcc 4.8), Linaro GDB 2013.05 (based on
 	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
@@ -45,8 +45,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 
 	  To use this toolchain, you must disable soft float usage.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
-	bool "Linaro 2013.06"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
+	bool "Linaro 2013.07"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -57,7 +57,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2013.06 (based on gcc 4.8), Linaro GDB 2013.05 (based on
+	  GCC 2013.07 (based on gcc 4.8), Linaro GDB 2013.05 (based on
 	  GDB 7.6), eglibc 2.17, Binutils 2013.06 (based on 2.23). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
@@ -816,9 +816,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b2266b6..e38ee48 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -239,15 +239,15 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.08_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.09/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.09_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.8.1.2
