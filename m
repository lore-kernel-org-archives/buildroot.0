From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 21:15:26 +0100
Subject: [Buildroot] [git commit] toolchain-external: update Linaro
	toolchains
Message-ID: <20141111205928.C3712B5970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28bca1cef50fa91d1f4a561ec989c646730eb8da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the ARM, ARMeb and AArch64 Linaro toolchains from 14.08 to
14.09. We can't bump to 14.10, because they completely changed the
toolchains and they are now completely broken: they switched from
Crosstool-NG to a new build tool to generate the toolchain, and now
the sysroot handling is completely borked.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in             |   14 +++++++-------
 toolchain/toolchain-external/toolchain-external.mk |   12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 39b56e1..c9feac3 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -7,7 +7,7 @@ comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2014.08"
+	bool "Linaro ARM 2014.09"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -20,8 +20,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2014.08 (based on gcc 4.9), Linaro GDB 2013.10 (based on
-	  GDB 7.6), eglibc 2.19, Binutils 2014.08 (based on 2.24). It
+	  GCC 2014.09 (based on gcc 4.9), Linaro GDB 2013.10 (based on
+	  GDB 7.6), eglibc 2.19, Binutils 2014.09 (based on 2.24). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
@@ -33,7 +33,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_PREFER_STATIC_LIB
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2014.08"
+	bool "Linaro armeb 2014.09"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -46,8 +46,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2014.08 (based on gcc 4.9), Linaro GDB
-	  2013.10 (based on GDB 7.6), eglibc 2.19, Binutils 2014.08
+	  uses Linaro GCC 2014.09 (based on gcc 4.9), Linaro GDB
+	  2013.10 (based on GDB 7.6), eglibc 2.19, Binutils 2014.09
 	  (based on 2.24). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
@@ -813,7 +813,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  http://wiki.xilinx.com/mb-gnu-tools
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 14.08"
+	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e16fce5..da3718c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -271,12 +271,12 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.08/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.08_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.08/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.08_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
@@ -352,8 +352,8 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.08/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.08_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu/
