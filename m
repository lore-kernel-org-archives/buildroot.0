From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:52:57 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-external: update Arm
 AArch64 BE toolchain 10.2-2020.11
Message-ID: <20210203213251.DA50A80DB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7a83b514c4960a28fd1e811d62aab72d6d859a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to gcc 10.2, gdb 10.1, binutils 2.35.1.

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external/toolchain-external-arm-aarch64-be/Config.in  | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                          | 6 +++---
 .../toolchain-external-arm-aarch64-be.mk                            | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index ea63687c5b..bbd6a0703d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2019.12"
+	bool "Arm AArch64 BE 2020.11"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -8,7 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index a82c2ba483..8e67a96599 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
-md5 f9885977e7f949f35bc0820f4bf99ab2 gcc-arm-9.2-2019.12-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
+md5  5da75bca337de5adade5b339709f8b16  gcc-arm-10.2-2020.11-x86_64-aarch64_be-none-linux-gnu.tar.xz
 # locally calculated
-sha256 55fc54a63567a35fb8280dfef91d50c0b5ad65aaea267f34fe7647b02d912f56 gcc-arm-9.2-2019.12-x86_64-aarch64_be-none-linux-gnu.tar.xz
+sha256  78a472aeb80f6ff56bfdef57ce165b233bac4af7aa2e12f454900518a30ddf20  gcc-arm-10.2-2020.11-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index e06f122991..384fc2efc5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2019.12
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2020.11
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
