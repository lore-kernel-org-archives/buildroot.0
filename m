From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 08:51:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/libmad
Message-ID: <20090120085117.2BBFD77108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-20 08:51:15 +0000 (Tue, 20 Jan 2009)
New Revision: 24919

Log:
libmad: unbreak build with gcc-4.3.x

libmad used the long deprecated -fforce-mem gcc flag, which no longer is
recognized in gcc-4.3.x. It has long been a noop, so simply remove it.

Added:
   trunk/buildroot/package/multimedia/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch


Changeset:
Added: trunk/buildroot/package/multimedia/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch
===================================================================
--- trunk/buildroot/package/multimedia/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/libmad/libmad-0.15.1b-remove-deprecated-cflags.patch	2009-01-20 08:51:15 UTC (rev 24919)
@@ -0,0 +1,33 @@
+libmad: remove deprecated cflags (-fforce-mem)
+
+fforce-mem has long been deprecated, and is completely removed from
+gcc 4.3.x on.
+---
+ configure    |    1 -
+ configure.ac |    1 -
+ 2 files changed, 2 deletions(-)
+
+Index: libmad-0.15.1b/configure.ac
+===================================================================
+--- libmad-0.15.1b.orig/configure.ac
++++ libmad-0.15.1b/configure.ac
+@@ -140,7 +140,6 @@
+     case "$optimize" in
+ 	-O|"-O "*)
+ 	    optimize="-O"
+-	    optimize="$optimize -fforce-mem"
+ 	    optimize="$optimize -fforce-addr"
+ 	    : #x optimize="$optimize -finline-functions"
+ 	    : #- optimize="$optimize -fstrength-reduce"
+Index: libmad-0.15.1b/configure
+===================================================================
+--- libmad-0.15.1b.orig/configure
++++ libmad-0.15.1b/configure
+@@ -19099,7 +19099,6 @@
+     case "$optimize" in
+ 	-O|"-O "*)
+ 	    optimize="-O"
+-	    optimize="$optimize -fforce-mem"
+ 	    optimize="$optimize -fforce-addr"
+ 	    : #x optimize="$optimize -finline-functions"
+ 	    : #- optimize="$optimize -fstrength-reduce"
