From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 08:58:07 +0100
Subject: [Buildroot] [git commit] toolchain-external: bump version of Linaro
 ARMeb toolchain to 2017.11
Message-ID: <20171215075846.C9FB180F8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0372d5f7983af407a996c78572ffea5a1502edf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external/toolchain-external-linaro-armeb/Config.in    | 6 +++---
 .../toolchain-external-linaro-armeb.hash                            | 4 ++--
 .../toolchain-external-linaro-armeb.mk                              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index 3c45a61..706b951 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -5,7 +5,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2017.08"
+	bool "Linaro armeb 2017.11"
 	depends on BR2_armeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
@@ -20,8 +20,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2017.08 (based on gcc 6.4.1), Linaro GDB
-	  2017.08 (based on GDB 8.0), glibc 2.23, Binutils 2017.08
+	  uses Linaro GCC 2017.11 (based on gcc 6.4.1), Linaro GDB
+	  2017.11 (based on GDB 8.0), glibc 2.23, Binutils 2017.11
 	  (based on 2.27). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
index c70d640..9a46b46 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7472ed65dd73945d4574e30fd2d26ef15d65b309dee83aaaf5a97df8fe3a94c7  gcc-linaro-6.4.1-2017.08-i686_armeb-linux-gnueabihf.tar.xz
-sha256 97a0de6ce7a77a2df7398e907621242752e6e5f1787772d7b308c82a3a039fab  gcc-linaro-6.4.1-2017.08-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 2f4bcff14c007feaf0ec68eca828ab6968bf7dbc6d50afa1615d39b591f424a8  gcc-linaro-6.4.1-2017.11-i686_armeb-linux-gnueabihf.tar.xz
+sha256 14c476c65d17032839ab60be2ec601a59920189305e27f02cb9171ad556c8a6b  gcc-linaro-6.4.1-2017.11-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
index ff2c5d6..a111e55 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2017.08
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2017.11
 TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
