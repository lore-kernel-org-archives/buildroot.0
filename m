From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 17:20:19 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump version of Linaro
 ARMeb toolchain to 7.3-2018.05
Message-ID: <20180623151806.3254080262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6090d3e916818872b75470ddacbfebd1cc258bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-linaro-armeb/Config.in  | 6 +++---
 .../toolchain-external-linaro-armeb.hash                          | 4 ++--
 .../toolchain-external-linaro-armeb.mk                            | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index a3dd3c9035..ebc6edefb5 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -4,7 +4,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2017.11"
+	bool "Linaro armeb 2018.05"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -18,8 +18,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2017.11 (based on gcc 7.2.1), Linaro GDB
-	  2017.11 (based on GDB 8.0), glibc 2.25, Binutils 2017.11
+	  uses Linaro GCC 2018.05 (based on gcc 7.3.1), Linaro GDB
+	  2018.05 (based on GDB 8.1), glibc 2.25, Binutils 2018.05
 	  (based on 2.28). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
index c61611c0c6..a3b6b88b7e 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1337734b61fa246ab20a371d2802d09ad80d7b17eb62327b3b69b9edfb6bc4a1  gcc-linaro-7.2.1-2017.11-i686_armeb-linux-gnueabihf.tar.xz
-sha256 c313149b6ea14e31f643aeee39e1460ae4245b75c75befd042ff4b63a07971c0  gcc-linaro-7.2.1-2017.11-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 60bf9924a0c039c94deb85cb9b129d0f28b28eadbb1fb3f7e2e227679cc43fc9  gcc-linaro-7.3.1-2018.05-i686_armeb-linux-gnueabihf.tar.xz
+sha256 c1bbd598b78458d6b7ea1c971fddf736c00d57890c7131fdafd4e789289c42f9  gcc-linaro-7.3.1-2018.05-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
index 1daa1c93a5..b8ea80ff60 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2017.11
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2018.05
 
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/7.2-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
