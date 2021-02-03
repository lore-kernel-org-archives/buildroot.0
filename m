From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:52:55 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-external: update Arm
 ARM toolchain 10.2-2020.11
Message-ID: <20210203213251.C298D80AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c6037f1d9d0cd58636c4f9d83bb553466fb0d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to gcc 10.2, gdb 10.1, binutils 2.35.1.

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/toolchain-external-arm-arm/Config.in | 8 ++++----
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash    | 6 +++---
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk      | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 29509635a3..e3bac38baa 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2019.12"
+	bool "Arm ARM 2020.11"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
@@ -16,12 +16,12 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 9.2.1,
-	  GDB 8.3.0, glibc 2.30, Binutils 2.33.1. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 10.2,
+	  GDB 10.1, glibc 2.31, Binutils 2.35.1. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 0a28cf0d59..a46ed4e40c 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
-md5 ae539d09dadacf7f22fcd6f54870e5ad gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
+md5  14f706db78cfb43aafed9056174572b0  gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz
 # locally calculated
-sha256 51bbaf22a4d3e7a393264c4ef1e45566701c516274dde19c4892c911caa85617 gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
+sha256  102825ae56c9e00142d06f35d2bdd3299edb6060e84a275a25b095e66fd3fc2a  gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 798573a474..88b6ae3403 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2019.12
-TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2020.11
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-9.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
