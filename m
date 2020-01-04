From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:30:26 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-external: update Arm
 AArch64 toolchain 9.2-2019.12
Message-ID: <20200104152057.726EA8EBBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b64b5482891b69b9a07a709ac45aeb8bcd7646ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to gcc 9.2.1, gdb 8.3.0, binutils 2.33.1.

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-arm-aarch64/Config.in     | 6 +++---
 .../toolchain-external-arm-aarch64/Config.in.options                | 2 +-
 .../toolchain-external-arm-aarch64.hash                             | 6 +++---
 .../toolchain-external-arm-aarch64.mk                               | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index fe650c27c5..52dcb2825e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2019.03"
+	bool "Arm AArch64 2019.12"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -7,8 +7,8 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
index 19b75805c9..dcc38a6a82 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options
@@ -1,7 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "aarch64-linux-gnu"
+	default "aarch64-none-linux-gnu"
 
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	default "toolchain-external-arm-aarch64"
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index db6660bdf8..edc30a2805 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz.asc
-md5 c7e2ae4fd6a66df642d59e8453775b4c gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz.asc
+md5 23ecc1dc528253c43e43365c6d923ec3 gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
 # locally calculated
-sha256 8ce3e7688a47d8cd2d8e8323f147104ae1c8139520eca50ccf8a7fa933002731 gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz
+sha256 8dfe681531f0bd04fb9c53cf3c0a3368c616aa85d48938eebe2b516376e06a66 gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 956460e704..51a81ec982 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2019.03
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2019.12
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
