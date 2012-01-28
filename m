From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:36:50 +0100
Subject: [Buildroot] [PATCH 10/16] external-toolchain: add Sourcery
	CodeBench x86/x86_64 2011.09
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <63ad54f0d18fcb94eff1476b168cae5588e6654d.1327772176.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   16 ++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index fea1565..a552cc2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -219,6 +219,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	  has support for the following variants:
             - SH2A, uClibc, big endian
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
+	bool "Sourcery CodeBench x86/x86_64 2011.09"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the x86/x86_64
+	  architectures, from Mentor Graphics. It uses gcc 4.6.1,
+	  binutils 2.21.53, glibc 2.13, gdb 7.2.50 and kernel headers
+	  3.0.1. It has support for the following variants:
+	    - Intel Pentium 4, glibc, 32 bits
+            - Intel Atom, glibc, 32 bits
+            - Intel Xeon, glibc, 64 bits
+            - Intel Core 2, glibc, 64 bits
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	bool "Sourcery CodeBench x86/x86_64 2010.09"
 	depends on BR2_i386 || BR2_x86_64
@@ -294,6 +309,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
+	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 409355e..a6a5028 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -216,6 +216,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/sgpp/lite/ia32/portal/package7682/public/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=ia32-2010.09-44-i686-pc-linux-gnu-i386-linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
+TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
 TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8378/
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
-- 
1.7.4.1
