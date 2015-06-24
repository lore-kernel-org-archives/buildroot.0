From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jun 2015 00:51:20 +0200
Subject: [Buildroot] [git commit] x264: bump to version 20150223-2245-stable
Message-ID: <20150624225746.40E5E80F45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=149af56707c1b4f562bea772ad9e82ddb8299738
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the Git repository instead of the snapshots,
since they are not generated anymore.

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-arm-do-not-append-CFLAGS-to-ASFLAGS.patch |   34 --------------------
 package/x264/x264.mk                               |    5 +--
 2 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/x264/0001-arm-do-not-append-CFLAGS-to-ASFLAGS.patch b/package/x264/0001-arm-do-not-append-CFLAGS-to-ASFLAGS.patch
deleted file mode 100644
index 3d40507..0000000
--- a/package/x264/0001-arm-do-not-append-CFLAGS-to-ASFLAGS.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 716ee56d0b35e512e8e0ae1a3e71f26e65e86be3 Mon Sep 17 00:00:00 2001
-From: Janne Grunau <janne-x264@jannau.net>
-Date: Sun, 20 Jul 2014 12:55:53 +0200
-Subject: [PATCH 01/24] arm: do not append CFLAGS to ASFLAGS
-
----
- configure | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 0a4cb94..a50f8d5 100755
---- a/configure
-+++ b/configure
-@@ -296,7 +296,7 @@ opencl="yes"
- CFLAGS="$CFLAGS -Wall -I. -I\$(SRCPATH)"
- LDFLAGS="$LDFLAGS"
- LDFLAGSCLI="$LDFLAGSCLI"
--ASFLAGS="$ASFLAGS"
-+ASFLAGS="$ASFLAGS -I. -I\$(SRCPATH)"
- RCFLAGS="$RCFLAGS"
- HAVE_GETOPT_LONG=1
- cross_prefix=""
-@@ -752,7 +752,7 @@ if [ $asm = auto -a $ARCH = ARM ] ; then
-     if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
-         cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
-         cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
--        ASFLAGS="$ASFLAGS $CFLAGS -c"
-+        ASFLAGS="$ASFLAGS -c"
-     else
-         echo "You specified a pre-ARMv6 or Thumb-1 CPU in your CFLAGS."
-         echo "If you really want to run on such a CPU, configure with --disable-asm."
--- 
-1.8.3.1
-
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 9968fbe..ace7f43 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-X264_VERSION = 20140930-2245-stable
-X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
-X264_SITE = ftp://ftp.videolan.org/pub/videolan/x264/snapshots
+X264_VERSION = c8a773ebfca148ef04f5a60d42cbd7336af0baf6
+X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPLv2+
 X264_DEPENDENCIES = host-pkgconf
 X264_LICENSE_FILES = COPYING
