From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Tue, 12 Jul 2011 23:31:46 +0200
Subject: [Buildroot] [git commit] sh: Add SH2A CodeSourcery external
	toolchain
Message-ID: <20110712214533.D99BE8A48E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=951574555c6b70194c4a5b96542dff42c4b97bdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added the CodeSourcery uCLinux/uClibc toolchain for the SH2A big
endian devices.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   13 +++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 04bd207..22cee53 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -152,6 +152,18 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
             - SH4A, uClibc, little endian
             - SH4A, uClibc, big endian
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
+	bool "CodeSoucery SH 2010.09"
+	depends on BR2_sh2a_nofpueb || BR2_sh2eb
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Toolchain for the SuperH architecture, from CodeSourcery. It
+	  uses gcc 4.5.1, binutils 2.20, uClibc 0.9.30, gdb 7.2.50 and
+	  kernel headers 2.6.35.2. It has support for
+	  the following variants:
+            - SH2A, uClibc, big endian
+
 config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	bool "Blackfin.uclinux.org 2010RC1"
 	depends on BR2_bfin
@@ -206,6 +218,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
+	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index ef71ce0..db9365b 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -189,6 +189,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-g
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
 TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8378/
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
-- 
1.7.3.4
