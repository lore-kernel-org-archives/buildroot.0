From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 20:26:38 +0100
Subject: [Buildroot] [git commit] external-toolchain: add Sourcery CodeBench
	x86/x86_64 2011.09
Message-ID: <20120306223951.DC89290D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d00bd2a1f79855cb37db57bea18181683b194302
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
