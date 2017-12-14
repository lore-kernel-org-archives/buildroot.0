From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 14 Dec 2017 23:54:24 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump version of Linaro
 ARM toolchain to 2017.11
Message-ID: <20171214225426.3654-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-linaro-arm/Config.in      | 6 +++---
 .../toolchain-external-linaro-arm.hash                              | 4 ++--
 .../toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk  | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index d665b99..3acc060 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -5,7 +5,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2017.08"
+	bool "Linaro ARM 2017.11"
 	depends on BR2_arm
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
@@ -21,8 +21,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2017.08 (based on gcc 6.4.1), Linaro GDB 2017.08 (based on
-	  GDB 8.0), glibc 2.23, Binutils 2017.08 (based on 2.27). It
+	  GCC 2017.11 (based on gcc 6.4.1), Linaro GDB 2017.11 (based on
+	  GDB 8.0), glibc 2.23, Binutils 2017.11 (based on 2.27). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
index 664663d..42d6c3b 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a99029dff3d17d28c89831f2cd2aa37752c2f85fe89fe38fdd17971c36a9f1dc  gcc-linaro-6.4.1-2017.08-i686_arm-linux-gnueabihf.tar.xz
-sha256 1c975a1936cc966099b3fcaff8f387d748caff27f43593214ae6d4601241ae40  gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 e088c71a4207a36beca9f3e60340ff7c678af53634765fc70865df80320dbdc7  gcc-linaro-6.4.1-2017.11-i686_arm-linux-gnueabihf.tar.xz
+sha256 1758d76daed9689e958668c3f2adef28c8c980b719d15594cbebfb5e5c4496f6  gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index a165184..61ffd25 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2017.08
+TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2017.11
 TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-- 
2.9.5
