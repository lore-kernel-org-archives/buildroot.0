From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 May 2018 22:29:58 +0200
Subject: [Buildroot] [PATCH] toolchain-external: bump CodeSourcery NIOSII to
 2018.05
Message-ID: <20180530202958.8993-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-add BR2_TOOLCHAIN_HAS_SSP since the toolchain support SSP.

Tested with qemu_nios2_10m50_defconfig and Qemu 2.10.1-3.fc27 release.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-niosII/Config.in        | 13 +++++++------
 .../toolchain-external-codesourcery-niosII.hash             | 10 +++++-----
 .../toolchain-external-codesourcery-niosII.mk               |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 4ac9c95c86..9d785a4b6b 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -1,16 +1,17 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2017.05"
+	bool "Sourcery CodeBench Nios-II 2018.05"
 	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 6.3, binutils 2.26,
-	  glibc 2.25, gdb 7.11 and kernel headers 4.7.
+	  from Mentor Graphics. It uses gcc 7.3, binutils 2.28,
+	  glibc 2.27, gdb 8.0.1 and kernel headers 4.15.5.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
index 3643f921b3..518e677f31 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
@@ -1,6 +1,6 @@
-# From https://sourcery.mentor.com/GNUToolchain/release3302
-md5 54b7f7056c2159f3a9ddeca8ca775ed1 sourceryg++-2017.05-4-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-md5 529a7fecf33d0d113a446413b9d1e173 sourceryg++-2017.05-4-nios2-linux-gnu.src.tar.bz2
+# From https://sourcery.mentor.com/GNUToolchain/release3374
+md5 4f536b3b9b4e00f483e82e304c0a27ae sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+md5 be42ab83da2e8db7b73dc890c2549570 sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
 # Locally calculated
-sha256 3f0307da3c0770b7cc3ed4a845038e6e438d3e3a96ce880f9a86b3d35f948a07  sourceryg++-2017.05-4-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 6e65878d0453708ee19098d3d68985bda244938d35999f3859915a2f5574fa08  sourceryg++-2017.05-4-nios2-linux-gnu.src.tar.bz2
+sha256 c19afb432b5b23f8d5d639831d3a423a3ea3c9cc62e0015020d20ea2eb36dd1b  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 d73a6364106dd62352711f932d3be8e97fdaaa548995678b5d38d9f21e22437a  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
index dfa4ea4258..cb0fe760ff 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2017.05-4
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2018.05-5
 
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
 TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-- 
2.14.3
