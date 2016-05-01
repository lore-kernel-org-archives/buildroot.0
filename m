From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:56:06 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump CodeSourcery MIPS
	to 2016.06-8
Message-ID: <20160501125807.57E897FA7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=230cfce93d2e1840c136972b8b2de523e20fdba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for the toolchain sources.

Runtime tested with Qemu with qemu_mips_malta_defconfig

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 8 ++++----
 toolchain/toolchain-external/toolchain-external.hash | 7 +++----
 toolchain/toolchain-external/toolchain-external.mk   | 2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d4e72a8..271ec5a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -178,7 +178,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	  This toolchain uses software-floating point.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	bool "Sourcery CodeBench MIPS 2015.11"
+	bool "Sourcery CodeBench MIPS 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_mips_32r2 || BR2_mips_64r2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -188,12 +188,12 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 5.2, binutils 2.25.51, glibc
-	  2.22, uClibc 0.9.30 and gdb 7.10.50, kernel headers 4.2. It
+	  Mentor Graphics. It uses gcc 5.3, binutils 2.25.51, glibc
+	  2.23, uClibc 0.9.30 and gdb 7.10.50, kernel headers 4.4.1. It
 	  has support for the following variants:
 	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
 	      Select MIPS (big endian) core
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 3df19bb..5f4e659 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -1,7 +1,3 @@
-# Sourcery CodeBench Lite for MIPS
-# Locally computed
-sha256 e653102803d0fadc0a83286400c03bc7932ab081d3f8fc8917c34e76468315a2  mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-
 ######################################
 # Next hashes are all locally computed
 
@@ -33,6 +29,9 @@ sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-201
 # Aarch64
 sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
+# MIPS
+sha256 d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
 
 # ARM toolchains from Texas Instrument's Arago project
 # There is one source file that covers both binary distributions.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index cd84395..4ec5797 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -335,7 +335,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.
 endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-130-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
