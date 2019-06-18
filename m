From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 14:53:25 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Arm AArch64-BE
 toolchain 8.3-2019.03
Message-ID: <20190618130148.B68BA8F675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c1033c411e7becc771441e2d29ec5d35725d0e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to gcc 8.3, gdb 8.2, binutils 2.32. Revert to linux kernel
headers 4.19 instead of 5.1-rc1 [1].

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

[1] https://bugs.linaro.org/show_bug.cgi?id=4297

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-arm-aarch64-be/Config.in  | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                          | 6 +++---
 .../toolchain-external-arm-aarch64-be.mk                            | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 76157730ec..130eca89d5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2018.11"
+	bool "Arm AArch64 BE 2019.03"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 580e10dd79..e20885e43e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.11/gcc-arm-8.2-2018.11-x86_64-aarch64_be-linux-gnu.tar.xz.asc
-md5 ab9a31ebe529b0a0cae78e610a9ffa0b gcc-arm-8.2-2018.11-x86_64-aarch64_be-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64_be-linux-gnu.tar.xz.asc
+md5 51301481db36aa743213e8cd16dfa1e7 gcc-arm-8.3-2019.03-x86_64-aarch64_be-linux-gnu.tar.xz
 # locally calculated
-sha256 36df73194804ac52053edf469c7ace73fb4b243a8306dadfb7b95c4f485abde4 gcc-arm-8.2-2018.11-x86_64-aarch64_be-linux-gnu.tar.xz
+sha256 5689d3cbb019144e55162c6b414ee1fc8362d9a21fbedadc49951ae97f95e62c gcc-arm-8.3-2019.03-x86_64-aarch64_be-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index a41d9cadf2..9aed38a8ca 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2018.11
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2019.03
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
