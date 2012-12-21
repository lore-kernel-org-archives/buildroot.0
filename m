From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Dec 2012 09:23:05 +0100
Subject: [Buildroot] [git commit] toolchain-external: remove support for
	'Sourcery CodeBench MIPS 2011.03'
Message-ID: <20121221082523.E36769A2F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7feaa991b51b6480f2dc311041c3ab69df153b5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   51 ------------------------------
 toolchain/toolchain-external/ext-tool.mk |    3 --
 2 files changed, 0 insertions(+), 54 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e28da87..4150a0a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -328,56 +328,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	    - MIPS32 little endian soft float uclibc
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
-	bool "Sourcery CodeBench MIPS 2011.03"
-	depends on BR2_mips || BR2_mipsel
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51, glibc
-	  2.13, uClibc 0.9.30 and gdb 7.2.50, kernel headers
-	  2.6.38. It has support for the following variants:
-	    - MIPS32 O32 big endian glibc
-	      Select a MIPS generic core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32 O32 little endian glibc
-	      Select a MIPS generic core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
-	    - MIPS32 big endian soft float glibc
-	      Select a MIPS generic core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32 little endian soft float glibc
-	      Select a MIPS generic core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
-	    - MIPS32 big endian microMIPS glibc
-	      Select a MIPS generic core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian microMIPS glibc
-	      Select a MIPS generic core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
-	    - MIPS32 big endian soft float microMIPS glibc
-	      Select a MIPS generic core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32 little endian soft float microMIPS glibc
-	      Select a MIPS generic core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
-	    - MIPS32 big endian uclibc
-	      Not usable in Buildroot yet.
-	    - MIPS32 little endian uclibc
-	      Not usable in Buildroot yet.
-	    - MIPS32 big endian soft float uclibc
-	      Not usable in Buildroot yet.
-	    - MIPS32 little endian soft float uclibc
-	      Not usable in Buildroot yet.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	bool "Sourcery CodeBench PowerPC 2011.03"
 	depends on BR2_powerpc
@@ -723,7 +673,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index ac639a7..0724cb6 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -193,9 +193,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_li
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11),y)
 TOOLCHAIN_EXTERNAL_SITE=https://launchpad.net/linaro-toolchain-binaries/trunk/2012.11/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package9469/public/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.03-110-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/GNUToolchain/package9761/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.09-75-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
