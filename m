From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 21 Dec 2017 19:21:19 +0100
Subject: [Buildroot] [PATCH 3/3] toolchain-external: bump version of Linaro
 AArch64 toolchain to 7.2-2017.11
In-Reply-To: <20171221182119.27682-1-romain.naour@gmail.com>
References: <20171221182119.27682-1-romain.naour@gmail.com>
Message-ID: <20171221182119.27682-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-linaro-aarch64/Config.in  | 5 ++---
 .../toolchain-external-linaro-aarch64.hash                          | 4 ++--
 .../toolchain-external-linaro-aarch64.mk                            | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index bcc112815e..9134c27f3b 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -1,15 +1,14 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2017.11"
 	depends on BR2_aarch64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Toolchain for the AArch64 architecture, from
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
index ecd4f3124e..fb24f1b34b 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7c5af17ab8c9b29367f839639f165db0e341f732553953f88a37d0721d3536a7  gcc-linaro-6.4.1-2017.11-i686_aarch64-linux-gnu.tar.xz
-sha256 7929a58f2e461f614641ca3a90a64336bde2abe6925cf39d3846b50960249b15  gcc-linaro-6.4.1-2017.11-x86_64_aarch64-linux-gnu.tar.xz
+sha256 3130033eaf18d7f7d775aa8ade1c7044683b0db6f332cae29cab7d1caaee97ed  gcc-linaro-7.2.1-2017.11-i686_aarch64-linux-gnu.tar.xz
+sha256 20181f828e1075f1a493947ff91e82dd578ce9f8638fbdfc39e24b62857d8f8d  gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
index ed334fd753..93e00669eb 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2017.11
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/7.2-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.2.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.14.3
