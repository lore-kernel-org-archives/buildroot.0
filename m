From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 19 Feb 2017 14:51:24 +0100
Subject: [Buildroot] [PATCH for-next 1/3] toolchain-external: bump Linaro
	ARM toolchain to 2017.02
Message-ID: <20170219135126.13285-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with qemu-2.7.1-2.fc25 and the qemu_arm_vexpress_defconfig

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-linaro-arm/Config.in    | 6 +++---
 .../toolchain-external-linaro-arm.hash                            | 4 ++--
 .../toolchain-external-linaro-arm.mk                              | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index 78aeb8e..f538eb7 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -4,7 +4,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2016.11"
+	bool "Linaro ARM 2017.02"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -19,8 +19,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2016.11 (based on gcc 6.2.1), Linaro GDB 2016.11 (based on
-	  GDB 7.12), glibc 2.23, Binutils 2016.11 (based on 2.27). It
+	  GCC 2017.02 (based on gcc 6.3.1), Linaro GDB 2017.02 (based on
+	  GDB 7.12), glibc 2.23, Binutils 2017.02 (based on 2.27). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
index d4452c3..ec861ec 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a2a4968bfb8537c1b3280b4f475d90d53a1a0f05f7afc7b43efed266cc4de446  gcc-linaro-6.2.1-2016.11-i686_arm-linux-gnueabihf.tar.xz
-sha256 5eb7ab2f8a0b4b960900321505cd6923a072cb3e2412102f5f72a6e74c2f0a55  gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 2505348d30fd3f67544b8915ad7a557e643fbf987f3113e092463b37577c9b95  gcc-linaro-6.3.1-2017.02-i686_arm-linux-gnueabihf.tar.xz
+sha256 fe1cae02e0734665487b9b642171a5685a6e91416cea869bb22590f6dc7260c3  gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index e098f47..b8ba43c 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2016.11
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/6.2-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2017.02
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/6.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.9.3
