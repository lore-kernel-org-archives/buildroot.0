From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Sep 2017 22:08:10 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump version of Linaro
	ARM toolchain to 2017.08
Message-ID: <20170925200812.4917-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GDB has been updated to 8.0 version in the release.

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-linaro-arm/Config.in    | 6 +++---
 .../toolchain-external-linaro-arm.hash                            | 4 ++--
 .../toolchain-external-linaro-arm.mk                              | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index f538eb7..fd4e03b 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -4,7 +4,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2017.02"
+	bool "Linaro ARM 2017.08"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -19,8 +19,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2017.02 (based on gcc 6.3.1), Linaro GDB 2017.02 (based on
-	  GDB 7.12), glibc 2.23, Binutils 2017.02 (based on 2.27). It
+	  GCC 2017.08 (based on gcc 6.4.1), Linaro GDB 2017.08 (based on
+	  GDB 8.0), glibc 2.23, Binutils 2017.08 (based on 2.27). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
index ec861ec..664663d 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2505348d30fd3f67544b8915ad7a557e643fbf987f3113e092463b37577c9b95  gcc-linaro-6.3.1-2017.02-i686_arm-linux-gnueabihf.tar.xz
-sha256 fe1cae02e0734665487b9b642171a5685a6e91416cea869bb22590f6dc7260c3  gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 a99029dff3d17d28c89831f2cd2aa37752c2f85fe89fe38fdd17971c36a9f1dc  gcc-linaro-6.4.1-2017.08-i686_arm-linux-gnueabihf.tar.xz
+sha256 1c975a1936cc966099b3fcaff8f387d748caff27f43593214ae6d4601241ae40  gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index b8ba43c..a165184 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2017.02
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/6.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2017.08
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.9.5
