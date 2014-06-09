From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:39:24 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump Linaro ARM to
	2014.05
Message-ID: <20140609134342.008CA9CF7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a167f0f930e9f0de3d1563e918995adf2f3f53d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The major changes are: switch to gcc 4.9 instead of 4.8, and switch to
glibc 2.19 instead of glibc 2.18.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in             |    7 +++----
 toolchain/toolchain-external/toolchain-external.mk |    4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 32e7787..2e7c4e9 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -7,13 +7,12 @@ comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2014.02"
+	bool "Linaro ARM 2014.05"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
-	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # toolchain generated before fix backport
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -21,8 +20,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2014.02 (based on gcc 4.8), Linaro GDB 2013.10 (based on
-	  GDB 7.6), eglibc 2.18, Binutils 2014.02 (based on 2.24). It
+	  GCC 2014.05 (based on gcc 4.9), Linaro GDB 2014.05 (based on
+	  GDB 7.6), eglibc 2.19, Binutils 2014.05 (based on 2.24). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1b19089..ba1690b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -276,8 +276,8 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.05/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.05_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
