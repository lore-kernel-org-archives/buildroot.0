From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 21:57:24 +0100
Subject: [Buildroot] [git commit] toolchain-external: bump Linaro AArch64
	toolchain to 2016.11
Message-ID: <20161202080021.3487681E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c72cca94b81a18b8a5d7debd1d0e15cef55c65c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with Qemu v2.7.0 and the qemu_aarch64_virt_defconfig

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external-linaro-aarch64/Config.in                   | 6 +++---
 .../toolchain-external-linaro-aarch64.hash                        | 4 ++--
 .../toolchain-external-linaro-aarch64.mk                          | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index 662f7d7..4dc8dac 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2016.05"
+	bool "Linaro AArch64 2016.11"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -7,8 +7,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Toolchain for the AArch64 architecture, from
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
index 7a2c038..f7f4209 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d43227248f282a652da42322fcf4abfd3021f2a2f62e0cf6e242d82f55966ba9  gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
-sha256 1941dcf6229d6706bcb89b7976d5d43d170efdd17c27d5fe1738e7ecf22adc37  gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
+sha256 057156a47b9cd68cdc0b48adcbe96c8249e3653b082f6c051dd75cb644f64b3a  gcc-linaro-6.2.1-2016.11-i686_aarch64-linux-gnu.tar.xz
+sha256 539cc29320bd84178cd093aae0b06b1ee5476511cecaba989faf9c6a1d4cdf81  gcc-linaro-6.2.1-2016.11-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
index a0543a7..fb498fe 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2016.05
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2016.11
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/6.2-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
