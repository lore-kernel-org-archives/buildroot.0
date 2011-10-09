From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Oct 2011 19:44:28 +0200
Subject: [Buildroot] [PATCH 5/9] ext-toolchain: Add CodeSourcery SH
	GNU/Linux 2011.03
In-Reply-To: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ac3a3707ec5d6f1524881aaf47e48217826ab13c.1318182187.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-external/Config.in   |   16 ++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ac712ba..c50acc8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -137,6 +137,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
             - e500mc glibc, 32 bits
             - 970 glibc hard-float, 64 bits
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
+	bool "CodeSourcery SH 2011.03"
+	depends on BR2_sh4a || BR2_sh4aeb
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Toolchain for the SuperH architecture, from CodeSourcery. It
+	  uses gcc 4.5.2, binutils 2.20, glibc 2.13, uClibc 0.9.30,
+	  gdb 7.2.50 and kernel headers 2.6.38. It has support for
+	  the following variants:
+            - SH4A, glibc, little endian
+            - SH4A, glibc, big endian
+            - SH4A, uClibc, little endian
+            - SH4A, uClibc, big endian
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "CodeSourcery SH 2010.09"
 	depends on BR2_sh4a || BR2_sh4aeb
@@ -238,6 +253,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
+	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index c8a214d..2662520 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -188,6 +188,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-g
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
+TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/sgpp/lite/superh/portal/package8759/public/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
-- 
1.7.4.1
