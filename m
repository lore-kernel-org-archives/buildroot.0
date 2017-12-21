From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 21 Dec 2017 19:21:17 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump version of Linaro
 ARM toolchain to 7.2-2017.11
Message-ID: <20171221182119.27682-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-linaro-arm/Config.in | 10 ++++------
 .../toolchain-external-linaro-arm.hash                         |  4 ++--
 .../toolchain-external-linaro-arm.mk                           |  6 +++---
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index 3acc060131..d383273c1b 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -1,13 +1,11 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2017.11"
 	depends on BR2_arm
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
@@ -16,13 +14,13 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2017.11 (based on gcc 6.4.1), Linaro GDB 2017.11 (based on
-	  GDB 8.0), glibc 2.23, Binutils 2017.11 (based on 2.27). It
+	  GCC 2017.11 (based on gcc 7.2.1), Linaro GDB 2017.11 (based on
+	  GDB 8.0), glibc 2.25, Binutils 2017.11 (based on 2.28). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
index 42d6c3bf8f..352cbb25c5 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e088c71a4207a36beca9f3e60340ff7c678af53634765fc70865df80320dbdc7  gcc-linaro-6.4.1-2017.11-i686_arm-linux-gnueabihf.tar.xz
-sha256 1758d76daed9689e958668c3f2adef28c8c980b719d15594cbebfb5e5c4496f6  gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 72919a3a99d4e28309bc8b0e615f44c65824ef012de50db3ffe9a34776e6f510  gcc-linaro-7.2.1-2017.11-i686_arm-linux-gnueabihf.tar.xz
+sha256 cee0087b1f1205b73996651b99acd3a926d136e71047048f1758ffcec69b1ca2  gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index 61ffd25a40..5437fe2d07 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2017.11
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/7.2-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.14.3
