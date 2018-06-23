From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jun 2018 11:19:35 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain-external: bump version of Linaro
 ARM toolchain to 7.3-2018.05
In-Reply-To: <20180623091936.20040-1-romain.naour@gmail.com>
References: <20180623091936.20040-1-romain.naour@gmail.com>
Message-ID: <20180623091936.20040-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-linaro-arm/Config.in    | 6 +++---
 .../toolchain-external-linaro-arm.hash                            | 4 ++--
 .../toolchain-external-linaro-arm.mk                              | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index d383273c1b..e880d5dbbd 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -4,7 +4,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2017.11"
+	bool "Linaro ARM 2018.05"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -19,8 +19,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2017.11 (based on gcc 7.2.1), Linaro GDB 2017.11 (based on
-	  GDB 8.0), glibc 2.25, Binutils 2017.11 (based on 2.28). It
+	  GCC 2018.05 (based on gcc 7.3.1), Linaro GDB 2018.05 (based on
+	  GDB 8.1), glibc 2.25, Binutils 2018.05 (based on 2.28). It
 	  generates code that runs on all Cortex-A profile devices,
 	  but tuned for the Cortex-A9. The code generated is Thumb 2,
 	  with the hard floating point calling convention, and uses
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
index 352cbb25c5..bd09cb5a89 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 72919a3a99d4e28309bc8b0e615f44c65824ef012de50db3ffe9a34776e6f510  gcc-linaro-7.2.1-2017.11-i686_arm-linux-gnueabihf.tar.xz
-sha256 cee0087b1f1205b73996651b99acd3a926d136e71047048f1758ffcec69b1ca2  gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 0613b5be14eb7d50a772bbd72069c428558e6e53fa5fce7201d75a13a475ffff  gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabihf.tar.xz
+sha256 7248bf105d0d468887a9b8a7120bb281ac8ad0223d9cb3d00dc7c2d498485d91  gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index 5437fe2d07..fda356bcea 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2017.11
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/7.2-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2018.05
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.14.4
