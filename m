From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 3 Dec 2014 16:52:25 +0000
Subject: [Buildroot] [PATCH v2 2/2] toolchain-external: add CodeSourcery
	MIPS 2014.11, remove 2013.05
In-Reply-To: <1417625545-54608-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417625545-54608-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1417625545-54608-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add CodeSourcery MIPS 2014.11 toolchain
- Remove CodeSourcery MIPS 2013.05 toolchain
- Update the hash file

Toolchain datasheet:
  https://sourcery.mentor.com/GNUToolchain/release2935?@template=datasheet

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2: minor cosmetic fixes

 toolchain/toolchain-external/Config.in             |   52 ++++++--------------
 .../toolchain-external/toolchain-external.hash     |    4 +-
 toolchain/toolchain-external/toolchain-external.mk |    6 +-
 3 files changed, 21 insertions(+), 41 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9034952..66166dd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -188,8 +188,8 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
-	bool "Sourcery CodeBench MIPS 2014.05"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
+	bool "Sourcery CodeBench MIPS 2014.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -198,11 +198,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
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
@@ -273,8 +273,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
-	bool "Sourcery CodeBench MIPS 2013.11"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
+	bool "Sourcery CodeBench MIPS 2014.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -283,11 +283,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
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
@@ -358,8 +358,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
-	bool "Sourcery CodeBench MIPS 2013.05"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
+	bool "Sourcery CodeBench MIPS 2013.11"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
@@ -368,20 +368,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
-	  2.17, uClibc 0.9.30 and gdb 7.4.50, kernel headers 3.8.2. It
+	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
+	  2.18, uClibc 0.9.30 and gdb 7.6.50, kernel headers 3.11. It
 	  has support for the following variants:
 	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
 	      Select MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Big-Endian, 2008 NaN, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008 -mips16
 	    - MIPS32r2 - Big-Endian, O32
 	      Select MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
@@ -389,10 +385,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	      Select MIPS (big endian) core
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Big-Endian, O32, microMIPS
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
 	    - MIPS32r2 - Big-Endian, Soft-Float, O32
 	      Select MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
@@ -400,18 +392,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	      Select MIPS (big endian) core
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32, microMIPS
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
 	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
 	      Select MIPS (little endian) core
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Little-Endian, 2008 NaN, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008 -mips16
 	    - MIPS32r2 - Little-Endian, O32
 	      Select MIPS (little endian) core
 	      Disable BR2_SOFT_FLOAT
@@ -419,10 +403,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	      Select MIPS (little endian) core
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, O32, microMIPS
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
 	    - MIPS32r2 - Little-Endian, Soft-Float, O32
 	      Select MIPS (little endian) core
 	      Select BR2_SOFT_FLOAT
@@ -992,9 +972,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 0d75005..7e64d4f 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -1,7 +1,7 @@
 # Sourcery CodeBench Lite for MIPS
+# From: https://sourcery.mentor.com/GNUToolchain/release2935
+md5  ad4a66e4791606c5df70f48c4a97b0ec  mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # From: https://sourcery.mentor.com/GNUToolchain/release2791
 md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # From: https://sourcery.mentor.com/GNUToolchain/release2640
 md5  0ba8bc4923c04728ee3787bed4cd5148  mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-# From: https://sourcery.mentor.com/GNUToolchain/release2554
-md5  937a383ab2aa5b154aa90fbc5d7b334e  mips-2013.05-66-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 51e0af5..992d0cb 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -278,15 +278,15 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.05-66-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411),y)
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.7.1
