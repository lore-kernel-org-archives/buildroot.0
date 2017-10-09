From: Mason <slash.tmp@free.fr>
Date: Mon, 9 Oct 2017 22:02:59 +0200
Subject: [Buildroot] [PATCH 4/6] toolchain-external: bump version of Linaro
 ARM toolchain to 2017.08
In-Reply-To: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
References: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
Message-ID: <7ebf3566-55e6-3ae1-6010-d0b6f7119e59@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

GDB has been updated to 8.0 version in the release.

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08

Tested with qemu_arm_vexpress_defconfig.

6.4-2017.08 includes several patches for glibc 2.23 mitigating
some of the "stack clash" vulnerabilities reported by Qualys.

https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt
https://git.linaro.org/toolchain/glibc.git/log/?h=linaro/2.23/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit aed5a0fcf7c0ce964deb5fe96d60f5e4d260fe14)
Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 .../toolchain-external/toolchain-external-linaro-arm/Config.in    | 6 +++---
 .../toolchain-external-linaro-arm.hash                            | 4 ++--
 .../toolchain-external-linaro-arm.mk                              | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index f538eb7eb31c..fd4e03b2bcc5 100644
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
index ec861ec1d9c9..664663df05ea 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2505348d30fd3f67544b8915ad7a557e643fbf987f3113e092463b37577c9b95  gcc-linaro-6.3.1-2017.02-i686_arm-linux-gnueabihf.tar.xz
-sha256 fe1cae02e0734665487b9b642171a5685a6e91416cea869bb22590f6dc7260c3  gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 a99029dff3d17d28c89831f2cd2aa37752c2f85fe89fe38fdd17971c36a9f1dc  gcc-linaro-6.4.1-2017.08-i686_arm-linux-gnueabihf.tar.xz
+sha256 1c975a1936cc966099b3fcaff8f387d748caff27f43593214ae6d4601241ae40  gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
index b8ba43ced810..a165184b5b1a 100644
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
2.14.2
