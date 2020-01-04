From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  4 Jan 2020 12:43:29 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: update Arm ARM
 toolchain 9.2-2019.12
Message-ID: <20200104114331.336812-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to gcc 9.2.1, gdb 8.3.0, binutils 2.33.1.

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-arm/Config.in               | 10 +++++-----
 .../toolchain-external-arm-arm/Config.in.options       |  2 +-
 .../toolchain-external-arm-arm.hash                    |  6 +++---
 .../toolchain-external-arm-arm.mk                      |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 8deba76b5a..4748ab53ae 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2019.03"
+	bool "Arm ARM 2019.12"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64"
@@ -14,13 +14,13 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 8.3.1,
-	  GDB 8.2.1, glibc 2.28, Binutils 2.32. It generates code that
+	  Arm toolchain for the ARM architecture. It uses GCC 9.2.1,
+	  GDB 8.3.0, glibc 2.30, Binutils 2.33.1. It generates code that
 	  runs on all Cortex-A profile devices, but tuned for the
 	  Cortex-A9. The code generated uses the hard floating point
 	  calling convention, and uses the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options
index 16e7d6ff3c..f2ce0f4544 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options
@@ -1,7 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arm-linux-gnueabihf"
+	default "arm-none-linux-gnueabihf"
 
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	default "toolchain-external-arm-arm"
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 5130f55853..0a28cf0d59 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz.asc
-md5 650dc30f7e937fa12e37ea70ff6e10dd gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
+md5 ae539d09dadacf7f22fcd6f54870e5ad gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
 # locally calculated
-sha256 d4f6480ecaa99e977e3833cc8a8e1263f9eecd1ce2d022bb548a24c4f32670f5 gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz
+sha256 51bbaf22a4d3e7a393264c4ef1e45566701c516274dde19c4892c911caa85617 gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 9f2a41afec..798573a474 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2019.03
-TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2019.12
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-9.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.24.1
