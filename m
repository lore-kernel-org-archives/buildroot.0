From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jun 2014 12:47:46 +0200
Subject: [Buildroot] [PATCH 09/11] toolchain-external: add CodeSourcery MIPS
	2014.05, remove 2012.09
In-Reply-To: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1401619668-28062-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 40 +++++++++++-----------
 toolchain/toolchain-external/toolchain-external.mk |  6 ++--
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 527ff04..3331b69 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -190,8 +190,8 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
-	bool "Sourcery CodeBench MIPS 2013.11"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
+	bool "Sourcery CodeBench MIPS 2014.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -200,12 +200,12 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
-	  2.18, uClibc 0.9.30 and gdb 7.6.50, kernel headers
-	  3.11. It has support for the following variants:
+	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
+	  2.18, uClibc 0.9.30 and gdb 7.7.50, kernel headers
+	  3.13. It has support for the following variants:
 	    - MIPS32 O32 big endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -259,8 +259,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
-	bool "Sourcery CodeBench MIPS 2013.05"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
+	bool "Sourcery CodeBench MIPS 2013.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -269,12 +269,12 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
-	  2.17, uClibc 0.9.30 and gdb 7.4.50, kernel headers
-	  3.8.2. It has support for the following variants:
+	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
+	  2.18, uClibc 0.9.30 and gdb 7.6.50, kernel headers
+	  3.11. It has support for the following variants:
 	    - MIPS32 O32 big endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -328,9 +328,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
-	bool "Sourcery CodeBench MIPS 2012.09"
-	depends on BR2_mips || BR2_mipsel
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
+	bool "Sourcery CodeBench MIPS 2013.05"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_PREFER_STATIC_LIB
@@ -338,12 +338,12 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51, glibc
-	  2.16, uClibc 0.9.30 and gdb 7.4.50, kernel headers
-	  3.5.4. It has support for the following variants:
+	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
+	  2.17, uClibc 0.9.30 and gdb 7.4.50, kernel headers
+	  3.8.2. It has support for the following variants:
 	    - MIPS32 O32 big endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -877,9 +877,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 47273d3..50e8dca 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -283,15 +283,15 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.04/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.8-2014.04_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.05-66-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.9.3
