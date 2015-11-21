From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Nov 2015 17:36:19 +0100
Subject: [Buildroot] [PATCH 6/7] toolchain-external: CodeSourcery MIPS:
	support only one version
In-Reply-To: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1448123780-30067-6-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/Config.in             | 180 +--------------------
 .../toolchain-external/toolchain-external.hash     |   4 -
 toolchain/toolchain-external/toolchain-external.mk |   8 +-
 3 files changed, 3 insertions(+), 189 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 62cb30b..0933712 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -236,7 +236,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_mips_32r2 || BR2_mips_64r2
@@ -323,180 +323,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
-	bool "Sourcery CodeBench MIPS 2014.11"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_mips_32r2 || BR2_mips_64r2
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	help
-	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.9.1, binutils 2.24.51, glibc
-	  2.20, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.16.2. It
-	  has support for the following variants:
-	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Big-Endian, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Little-Endian, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
-	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS64r2 - Big-Endian, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Big-Endian, Soft-Float, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, Soft-Float, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
-	bool "Sourcery CodeBench MIPS 2014.05"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_mips_32r2 || BR2_mips_64r2
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	help
-	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
-	  2.18, uClibc 0.9.30 and gdb 7.7.50, kernel headers 3.13. It
-	  has support for the following variants:
-	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Big-Endian, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Little-Endian, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
-	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS64r2 - Big-Endian, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Big-Endian, Soft-Float, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, Soft-Float, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-
 comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
@@ -972,9 +798,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-amd-linux-gnu"  if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 472f2af..d5b4ada 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -1,10 +1,6 @@
 # Sourcery CodeBench Lite for MIPS
 # From: https://sourcery.mentor.com/GNUToolchain/release3068
 md5  0fcdc0fee260c7bed060c999bfe8440d  mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-# From: https://sourcery.mentor.com/GNUToolchain/release2935
-md5  ad4a66e4791606c5df70f48c4a97b0ec  mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-# From: https://sourcery.mentor.com/GNUToolchain/release2791
-md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 
 ######################################
 # Next hashes are all locally computed
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 95aa00d..9ac9f3b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -357,13 +357,7 @@ TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binari
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.1-2015.08-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505_LIB_NAMES_FIX
-- 
2.4.3
