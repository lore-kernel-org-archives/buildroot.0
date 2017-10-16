From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 09:18:13 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain-external: bump
	version of Linaro ARMeb toolchain to 2017.08
Message-ID: <20171016071851.594BD81090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef2798d8b0e5c986aaca1d8e7d53b87e065ecb67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

GDB has been updated to 8.0 version in the release.

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08

6.4-2017.08 includes several patches for glibc 2.23 mitigating
some of the "stack clash" vulnerabilities reported by Qualys.

https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt
https://git.linaro.org/toolchain/glibc.git/log/?h=linaro/2.23/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 90524c69f42b8331dd1aa534994fe7f63f618ebf)
Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-linaro-armeb/Config.in  | 6 +++---
 .../toolchain-external-linaro-armeb.hash                          | 4 ++--
 .../toolchain-external-linaro-armeb.mk                            | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index 14c7481..5fb7eb5 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -4,7 +4,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2017.02"
+	bool "Linaro armeb 2017.08"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -18,8 +18,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2017.02 (based on gcc 6.3.1), Linaro GDB
-	  2017.02 (based on GDB 7.12), glibc 2.23, Binutils 2017.02
+	  uses Linaro GCC 2017.08 (based on gcc 6.4.1), Linaro GDB
+	  2017.08 (based on GDB 8.0), glibc 2.23, Binutils 2017.08
 	  (based on 2.27). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
index 8266145..c70d640 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e98aeec91bf8a75247220f41ed189a3e81f1e6c6869423c9b6c83716d6558e61  gcc-linaro-6.3.1-2017.02-i686_armeb-linux-gnueabihf.tar.xz
-sha256 7a1ec874859c8b30b5e13bfba63372170ea78587a0ab6a587a115c932bb3498c  gcc-linaro-6.3.1-2017.02-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 7472ed65dd73945d4574e30fd2d26ef15d65b309dee83aaaf5a97df8fe3a94c7  gcc-linaro-6.4.1-2017.08-i686_armeb-linux-gnueabihf.tar.xz
+sha256 97a0de6ce7a77a2df7398e907621242752e6e5f1787772d7b308c82a3a039fab  gcc-linaro-6.4.1-2017.08-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
index 999d11e..ff2c5d6 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2017.02
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/6.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2017.08
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
