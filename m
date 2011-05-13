From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2011 15:24:45 +0200
Subject: [Buildroot] [PATCH 2/2] external-toolchain: Add MIPS CodeSourcery
	2011.03
In-Reply-To: <cover.1305293029.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305293029.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e7e0d0771c3e6d962fc4a336e1fa7a709e6635b0.1305293029.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   24 ++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8e3f798..079c097 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -59,6 +59,29 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
             - ARMv4T, little endian, soft-float, glibc
             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
+	bool "CodeSourcery MIPS 2011.03"
+	depends on BR2_mips || BR2_mipsel
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Toolchain for the MIPS architecture, from CodeSourcery. It
+	  uses gcc 4.5.2, binutils 2.20.51, glibc 2.13, uClibc 0.9.30
+	  and gdb 7.2.50, kernel headers 2.6.38. It has support for
+	  the following variants:
+            - MIPS32 O32 big endian glibc
+            - MIPS32 O32 little endian glibc
+            - MIPS32 big endian soft float glibc
+            - MIPS32 little endian soft float glibc
+            - MIPS32 big endian microMIPS glibc
+            - MIPS32 little endian microMIPS glibc
+            - MIPS32 big endian soft float microMIPS glibc
+            - MIPS32 little endian soft float microMIPS glibc
+            - MIPS32 big endian uclibc
+            - MIPS32 little endian uclibc
+            - MIPS32 big endian soft float uclibc
+            - MIPS32 little endian soft float uclibc
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	bool "CodeSourcery MIPS 4.4"
 	depends on BR2_mips || BR2_mipsel
@@ -151,6 +174,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 53fff61..6d12ba7 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -177,6 +177,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.03-41-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
 TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103),y)
+TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/mips/portal/package8715/public/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.03-53-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.7.1
