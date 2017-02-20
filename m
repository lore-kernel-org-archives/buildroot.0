From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:58:46 +0100
Subject: [Buildroot] [git commit branch/next] toolchain-external: bump
	Linaro ARMeb toolchain to 2017.02
Message-ID: <20170220205904.3A1C17FC98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52f059f38d463159540d87c0a46edd98eea5629d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external/toolchain-external-linaro-armeb/Config.in  | 6 +++---
 .../toolchain-external-linaro-armeb.hash                          | 4 ++--
 .../toolchain-external-linaro-armeb.mk                            | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index c7f2f5f..14c7481 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -4,7 +4,7 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2016.11"
+	bool "Linaro armeb 2017.02"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -18,8 +18,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2016.11 (based on gcc 6.2.1), Linaro GDB
-	  2016.11 (based on GDB 7.12), glibc 2.23, Binutils 2016.11
+	  uses Linaro GCC 2017.02 (based on gcc 6.3.1), Linaro GDB
+	  2017.02 (based on GDB 7.12), glibc 2.23, Binutils 2017.02
 	  (based on 2.27). It generates code that runs on all Cortex-A
 	  profile devices, but tuned for the Cortex-A9. The code
 	  generated is Thumb 2, with the hard floating point calling
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
index a041539..8266145 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 05a34c56da56b9b1e1a61ad1217dc4e751e1d277932dbeaa82b6c242cf0f2ec9  gcc-linaro-6.2.1-2016.11-i686_armeb-linux-gnueabihf.tar.xz
-sha256 319cb7c6363a3116357b163d0b4f9e0c27cfcb6153f3c26a34edf892819f12e5  gcc-linaro-6.2.1-2016.11-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256 e98aeec91bf8a75247220f41ed189a3e81f1e6c6869423c9b6c83716d6558e61  gcc-linaro-6.3.1-2017.02-i686_armeb-linux-gnueabihf.tar.xz
+sha256 7a1ec874859c8b30b5e13bfba63372170ea78587a0ab6a587a115c932bb3498c  gcc-linaro-6.3.1-2017.02-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
index ba138e1..999d11e 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2016.11
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/6.2-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2017.02
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/6.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
