From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  3 Feb 2021 00:19:04 +0100
Subject: [Buildroot] [PATCHv2 2/3] toolchain/toolchain-external: update Arm
 AArch64 toolchain 10.2-2020.11
In-Reply-To: <20210202231905.622742-1-romain.naour@gmail.com>
References: <20210202231905.622742-1-romain.naour@gmail.com>
Message-ID: <20210202231905.622742-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to gcc 10.2, gdb 10.1, binutils 2.35.1.

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-aarch64/Config.in                | 4 ++--
 .../toolchain-external-arm-aarch64.hash                     | 6 +++---
 .../toolchain-external-arm-aarch64.mk                       | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 52dcb2825e..b6062846a4 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2019.12"
+	bool "Arm AArch64 2020.11"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -8,7 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index edc30a2805..90abe56d64 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz.asc
-md5 23ecc1dc528253c43e43365c6d923ec3 gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz.asc
+md5  d6e6676d31c51405ae0fc7687ef0a224  gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz
 # locally calculated
-sha256 8dfe681531f0bd04fb9c53cf3c0a3368c616aa85d48938eebe2b516376e06a66 gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
+sha256  fe7f72330216612de44891ebe5e228eed7c0c051ac090c395b2b33115c6f5408  gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 51a81ec982..583e4a763d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2019.12
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2020.11
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.29.2
