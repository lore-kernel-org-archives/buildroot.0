From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  5 Jun 2019 13:55:30 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: update Arm ARM
 toolchain 8.3-2019.03
Message-ID: <20190605115532.5015-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to gcc 8.1 and gcc 8.2.
Revert to linux kernel headers 4.19 instead of 5.1-rc1 [1].

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_arm_vexpress_defconfig.

[1] https://bugs.linaro.org/show_bug.cgi?id=4297

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-arm/Config.in                  | 8 ++++----
 .../toolchain-external-arm-arm.hash                       | 6 +++---
 .../toolchain-external-arm-arm.mk                         | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 886b2a0aa3..8deba76b5a 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2018.11"
+	bool "Arm ARM 2019.03"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64"
@@ -14,13 +14,13 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 8.2.1,
-	  GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates code that
+	  Arm toolchain for the ARM architecture. It uses GCC 8.3.1,
+	  GDB 8.2.1, glibc 2.28, Binutils 2.32. It generates code that
 	  runs on all Cortex-A profile devices, but tuned for the
 	  Cortex-A9. The code generated uses the hard floating point
 	  calling convention, and uses the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index cd7f526547..5130f55853 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.11/gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz.asc
-md5 59ccf965837ed1c5ba59e5ad4b688b21 gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz.asc
+md5 650dc30f7e937fa12e37ea70ff6e10dd gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz
 # locally calculated
-sha256 3f9bc7a68f744a5edc7caebff5f3f2c3bc1ff9d8ac8b05f7680a0071461deede gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz
+sha256 d4f6480ecaa99e977e3833cc8a8e1263f9eecd1ce2d022bb548a24c4f32670f5 gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 0c21affd7b..9f2a41afec 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2018.11
-TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2019.03
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.21.0
