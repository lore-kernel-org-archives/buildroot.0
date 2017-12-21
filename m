From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 21 Dec 2017 19:21:18 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain-external: bump version of Linaro
 ARMeb toolchain to 7.2-2017.11
In-Reply-To: <20171221182119.27682-1-romain.naour@gmail.com>
References: <20171221182119.27682-1-romain.naour@gmail.com>
Message-ID: <20171221182119.27682-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-linaro-armeb/Config.in                | 12 +++++-------
 .../toolchain-external-linaro-armeb.hash                     |  4 ++--
 .../toolchain-external-linaro-armeb.mk                       |  7 ++++---
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index 706b951227..a3dd3c9035 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -1,13 +1,11 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_armeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2017.11"
 	depends on BR2_armeb
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
@@ -16,13 +14,13 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2017.11 (based on gcc 6.4.1), Linaro GDB
-	  2017.11 (based on GDB 8.0), glibc 2.23, Binutils 2017.11
-	  (based on 2.27). It generates code that runs on all Cortex-A
+	  uses Linaro GCC 2017.11 (based on gcc 7.2.1), Linaro GDB
+	  2017.11 (based on GDB 8.0), glibc 2.25, Binutils 2017.11
+	  (based on 2.28). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
 	  convention, and uses the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
index 9a46b46394..c61611c0c6 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2f4bcff14c007feaf0ec68eca828ab6968bf7dbc6d50afa1615d39b591f424a8  gcc-linaro-6.4.1-2017.11-i686_armeb-linux-gnueabihf.tar.xz
-sha256 14c476c65d17032839ab60be2ec601a59920189305e27f02cb9171ad556c8a6b  gcc-linaro-6.4.1-2017.11-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 1337734b61fa246ab20a371d2802d09ad80d7b17eb62327b3b69b9edfb6bc4a1  gcc-linaro-7.2.1-2017.11-i686_armeb-linux-gnueabihf.tar.xz
+sha256 c313149b6ea14e31f643aeee39e1460ae4245b75c75befd042ff4b63a07971c0  gcc-linaro-7.2.1-2017.11-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
index a111e55be4..1daa1c93a5 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -5,12 +5,13 @@
 ################################################################################
 
 TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2017.11
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
+
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/7.2-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.14.3
