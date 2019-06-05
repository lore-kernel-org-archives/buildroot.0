From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  5 Jun 2019 13:55:31 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain-external: update Arm AArch64
 toolchain 8.3-2019.03
In-Reply-To: <20190605115532.5015-1-romain.naour@gmail.com>
References: <20190605115532.5015-1-romain.naour@gmail.com>
Message-ID: <20190605115532.5015-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to gcc 8.1 and gcc 8.2.
Revert to linux kernel headers 4.19 instead of 5.1-rc1 [1].

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_aarch64_virt_defconfig.

[1] https://bugs.linaro.org/show_bug.cgi?id=4297

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-aarch64/Config.in                | 4 ++--
 .../toolchain-external-arm-aarch64.hash                     | 6 +++---
 .../toolchain-external-arm-aarch64.mk                       | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 3d4a9b62a4..fe650c27c5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2018.11"
+	bool "Arm AArch64 2019.03"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index cda90f7517..db6660bdf8 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.11/gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz.asc
-md5 319ca548ff05b0ec1008988a7e5ab619 gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz.asc
+md5 c7e2ae4fd6a66df642d59e8453775b4c gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz
 # locally calculated
-sha256 0142366da2f30feb1c366997cbdaa02286c8f1aa527c0fc177ee5ce8e77970fc gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
+sha256 8ce3e7688a47d8cd2d8e8323f147104ae1c8139520eca50ccf8a7fa933002731 gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 0398bd1297..956460e704 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2018.11
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2019.03
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.21.0
