From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 23:12:42 +0200
Subject: [Buildroot] [git commit] toolchain-external: Version bump to
	2013.05 release for MIPS
Message-ID: <20130611100806.5651F9AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d34fb7c6208423243e0123600fca3e11723705d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove old 2011.09 release. Allow MIPS64 cores on
2013.05 release since they are supported by the toolchain.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   42 +++++++++++++++---------------
 toolchain/toolchain-external/ext-tool.mk |    6 ++--
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 47b2bf5..37c5648 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -136,9 +136,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
-	bool "Sourcery CodeBench MIPS 2012.09"
-	depends on BR2_mips || BR2_mipsel
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
+	bool "Sourcery CodeBench MIPS 2013.05"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -146,14 +146,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
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
@@ -161,7 +161,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
@@ -169,7 +169,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
 	    - MIPS64 big endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	    - MIPS32 little endian soft float glibc
@@ -177,7 +177,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
@@ -206,8 +206,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
-	bool "Sourcery CodeBench MIPS 2012.03"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
+	bool "Sourcery CodeBench MIPS 2012.09"
 	depends on BR2_mips || BR2_mipsel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -216,9 +216,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
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
@@ -276,8 +276,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
-	bool "Sourcery CodeBench MIPS 2011.09"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
+	bool "Sourcery CodeBench MIPS 2012.03"
 	depends on BR2_mips || BR2_mipsel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -286,9 +286,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.21.53, glibc
-	  2.13, uClibc 0.9.30 and gdb 7.2.50, kernel headers
-	  3.0.1. It has support for the following variants:
+	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
+	  2.15, uClibc 0.9.30 and gdb 7.2.50, kernel headers
+	  3.2.10. It has support for the following variants:
 	    - MIPS32 O32 big endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -754,9 +754,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 93b3b15..218ef07 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -209,15 +209,15 @@ TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.02-01-20130221
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03),y)
 TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.09-75-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=mips-2013.05-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
