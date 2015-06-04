From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 4 Jun 2015 17:03:43 +0100
Subject: [Buildroot] [PATCH] toolchain-external: add CodeSourcery MIPS
	2015.05, remove 2013.11
Message-ID: <1433433823-15985-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add CodeSourcery MIPS 2015.05 toolchain
- Remove CodeSourcery MIPS 2013.11 toolchain
- Update the hash file

Toolchain datasheet:
  https://sourcery.mentor.com/GNUToolchain/release3068?@template=datasheet

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/Config.in             | 32 +++++++++++-----------
 .../toolchain-external/toolchain-external.hash     |  4 +--
 toolchain/toolchain-external/toolchain-external.mk |  6 ++--
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6ea6838..017e913 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -188,8 +188,8 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
-	bool "Sourcery CodeBench MIPS 2014.11"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
+	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -198,11 +198,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.9.1, binutils 2.24.51, glibc
-	  2.20, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.16.2. It
+	  Mentor Graphics. It uses gcc 4.9.2, binutils 2.24.51, glibc
+	  2.21, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.19. It
 	  has support for the following variants:
 	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
 	      Select MIPS (big endian) core
@@ -273,8 +273,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
-	bool "Sourcery CodeBench MIPS 2014.05"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
+	bool "Sourcery CodeBench MIPS 2014.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -283,11 +283,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
-	  2.18, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.13. It
+	  Mentor Graphics. It uses gcc 4.9.1, binutils 2.24.51, glibc
+	  2.20, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.16.2. It
 	  has support for the following variants:
 	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
 	      Select MIPS (big endian) core
@@ -358,8 +358,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
-	bool "Sourcery CodeBench MIPS 2013.11"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
+	bool "Sourcery CodeBench MIPS 2014.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -368,11 +368,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
-	  2.18, uClibc 0.9.30 and gdb 7.6.50, kernel headers 3.11. It
+	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
+	  2.18, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.13. It
 	  has support for the following variants:
 	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
 	      Select MIPS (big endian) core
@@ -914,9 +914,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 444ddfd..3980c62 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -1,10 +1,10 @@
 # Sourcery CodeBench Lite for MIPS
+# From: https://sourcery.mentor.com/GNUToolchain/release3068
+md5  0fcdc0fee260c7bed060c999bfe8440d  mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # From: https://sourcery.mentor.com/GNUToolchain/release2935
 md5  ad4a66e4791606c5df70f48c4a97b0ec  mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # From: https://sourcery.mentor.com/GNUToolchain/release2791
 md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-# From: https://sourcery.mentor.com/GNUToolchain/release2640
-md5  0ba8bc4923c04728ee3787bed4cd5148  mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 
 # Sourcery CodeBench Lite for AMD64
 # From https://sourcery.mentor.com/GNUToolchain/release2777
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b293ba9..22f8118 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -284,15 +284,15 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505),y)
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.3.6
