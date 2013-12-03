From: Sven Neumann <neumann@teufel.de>
Date: Tue, 03 Dec 2013 23:11:02 +0100
Subject: [Buildroot] [PATCH] flac: update to version 1.3.0
Message-ID: <1386108662.6732.3.camel@bender.Speedport_W_724V_Typ_A_05011601_00_065>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Remove flac-no-altivec.patch as it appears to have been
merged upstream.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/flac/flac-no-altivec.patch | 28 ----------------------------
 package/flac/flac.mk               |  5 +++--
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 package/flac/flac-no-altivec.patch

diff --git a/package/flac/flac-no-altivec.patch b/package/flac/flac-no-altivec.patch
deleted file mode 100644
index c6a535b..0000000
--- a/package/flac/flac-no-altivec.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-FLAC assumes every powerpc around has altivec ABI which is wrong.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura flac-1.2.1/src/libFLAC/Makefile.am flac-1.2.1-noaltivec/src/libFLAC/Makefile.am
---- flac-1.2.1/src/libFLAC/Makefile.am	2007-09-14 18:06:17.000000000 -0300
-+++ flac-1.2.1-noaltivec/src/libFLAC/Makefile.am	2011-01-06 15:14:36.384242614 -0300
-@@ -41,7 +41,7 @@
- else
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
- #@@@ PPC optimizations temporarily disabled
--CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
-+CPUCFLAGS = -DFLAC__NO_ASM
- endif
- endif
- 
-diff -Nura flac-1.2.1/src/libFLAC/Makefile.in flac-1.2.1-noaltivec/src/libFLAC/Makefile.in
---- flac-1.2.1/src/libFLAC/Makefile.in	2007-09-16 17:05:12.000000000 -0300
-+++ flac-1.2.1-noaltivec/src/libFLAC/Makefile.in	2011-01-06 15:14:50.997545602 -0300
-@@ -240,7 +240,7 @@
- @FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_TRUE at CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
- #@@@ PPC optimizations temporarily disabled
-- at FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_FALSE at CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
-+ at FLaC__CPU_PPC_TRUE@@FLaC__SYS_DARWIN_FALSE at CPUCFLAGS = -DFLAC__NO_ASM
- 
- AM_CFLAGS = $(DEBUGCFLAGS) $(CPUCFLAGS) @OGG_CFLAGS@
- @FLaC__CPU_PPC_TRUE@@FLaC__NO_ASM_FALSE at ARCH_SUBDIRS = ppc
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 95cd5a1..177e1ce 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.2.1
-FLAC_SITE = http://downloads.sourceforge.net/project/flac/flac-src/flac-$(FLAC_VERSION)-src
+FLAC_VERSION = 1.3.0
+FLAC_SITE = http://downloads.xiph.org/releases/flac/
+FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
 
 FLAC_CONF_OPT = \
-- 
1.8.4.2
