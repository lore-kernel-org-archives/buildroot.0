From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 09:12:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20090120091206.D9DA1770F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-20 09:12:06 +0000 (Tue, 20 Jan 2009)
New Revision: 24921

Log:
mplayer: fix configure for powerpc-linux

Added:
   trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-ppc-configure.patch


Changeset:
Added: trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-ppc-configure.patch
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-ppc-configure.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-ppc-configure.patch	2009-01-20 09:12:06 UTC (rev 24921)
@@ -0,0 +1,27 @@
+mplayer: configure: handle target=powerpc-linux as well as ppc-linux
+---
+ configure |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: MPlayer-1.0rc1/configure
+===================================================================
+--- MPlayer-1.0rc1.orig/configure
++++ MPlayer-1.0rc1/configure
+@@ -133,7 +133,7 @@
+ 
+ ppc() {
+   case "$host_arch" in
+-    ppc) return 0;;
++    ppc|powerpc) return 0;;
+     *) return 1;;
+   esac
+ }
+@@ -1213,7 +1213,7 @@
+     _optimizing=''
+     ;;
+ 
+-  ppc)
++  ppc|powerpc)
+     _def_arch='#define ARCH_POWERPC 1'
+     _def_dcbzl='#define NO_DCBZL 1'
+     _target_arch='TARGET_ARCH_POWERPC = yes'
