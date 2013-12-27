From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 12:32:18 +0100
Subject: [Buildroot] [PATCH 2/6] toolchain-external: add Sourcery MIPS
	2013.11, remove Sourcery MIPS 2012.03
In-Reply-To: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388143942-1187-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the support for the recently release Sourcery MIPS
2013.11 toolchain (gcc 4.8, gdb 7.6, glibc 2.18, gdb 7.6), and
consequently removes the support for the Sourcery MIPS 2012.03
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 42 +++++++++++-----------
 toolchain/toolchain-external/toolchain-external.mk |  6 ++--
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0607693..d6d1960 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -201,8 +201,8 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
-	bool "Sourcery CodeBench MIPS 2013.05"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
+	bool "Sourcery CodeBench MIPS 2013.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -213,9 +213,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
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
@@ -269,9 +269,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
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
@@ -281,35 +281,35 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
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
 	    - MIPS64 big endian glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
 	    - MIPS32 O32 little endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
 	    - MIPS64 little endian glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
 	    - MIPS32 big endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
 	    - MIPS64 big endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	    - MIPS32 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
 	    - MIPS64 little endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	    - MIPS32 big endian microMIPS glibc
@@ -337,8 +337,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
-	bool "Sourcery CodeBench MIPS 2012.03"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
+	bool "Sourcery CodeBench MIPS 2012.09"
 	depends on BR2_mips || BR2_mipsel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -349,9 +349,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
-	  2.15, uClibc 0.9.30 and gdb 7.2.50, kernel headers
-	  3.2.10. It has support for the following variants:
+	  Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51, glibc
+	  2.16, uClibc 0.9.30 and gdb 7.4.50, kernel headers
+	  3.5.4. It has support for the following variants:
 	    - MIPS32 O32 big endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -851,9 +851,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 747d7e3..64c4d0b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -277,15 +277,15 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.09/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.05-66-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311),y)
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.8.3.2
