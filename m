From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Oct 2008 11:54:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
Message-ID: <20081023185410.CE89F3C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-23 11:54:10 -0700 (Thu, 23 Oct 2008)
New Revision: 23773

Log:
lsof: bump version

Reported by Mark McLaurin.

Modified:
   trunk/buildroot/package/lsof/lsof-makefile.patch
   trunk/buildroot/package/lsof/lsof-noportmap.patch
   trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch
   trunk/buildroot/package/lsof/lsof-uclibc.patch
   trunk/buildroot/package/lsof/lsof.mk


Changeset:
Modified: trunk/buildroot/package/lsof/lsof-makefile.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-makefile.patch	2008-10-23 15:07:34 UTC (rev 23772)
+++ trunk/buildroot/package/lsof/lsof-makefile.patch	2008-10-23 18:54:10 UTC (rev 23773)
@@ -1,6 +1,6 @@
-diff -ru lsof_4.80.orig/lsof_4.80_src/lib/Makefile.skel lsof_4.80/lsof_4.80_src/lib/Makefile.skel
---- lsof_4.80.orig/lsof_4.80_src/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
-+++ lsof_4.80/lsof_4.78_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
+diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
+--- lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
++++ lsof_4.81/lsof_4.81_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
 @@ -21,8 +21,8 @@
  all:	${LIB}
  

Modified: trunk/buildroot/package/lsof/lsof-noportmap.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-noportmap.patch	2008-10-23 15:07:34 UTC (rev 23772)
+++ trunk/buildroot/package/lsof/lsof-noportmap.patch	2008-10-23 18:54:10 UTC (rev 23773)
@@ -1,5 +1,5 @@
---- lsof_4.80/lsof_4.80_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
-+++ lsof_4.80/lsof_4.80_src/print.c	2006-08-23 13:38:29.000000000 -0600
+--- lsof_4.81/lsof_4.81_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
++++ lsof_4.81/lsof_4.81_src/print.c	2006-08-23 13:38:29.000000000 -0600
 @@ -148,6 +148,7 @@
  static void
  fill_portmap()

Modified: trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch	2008-10-23 15:07:34 UTC (rev 23772)
+++ trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch	2008-10-23 18:54:10 UTC (rev 23773)
@@ -1,6 +1,6 @@
-diff -rdup lsof_4.80.orig/lsof_4.80_src/dialects/linux/machine.h lsof_4.80/lsof_4.80_src/dialects/linux/machine.h
---- lsof_4.80.orig/lsof_4.80_src/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
-+++ lsof_4.80/lsof_4.80_src/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
+diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
+--- lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
++++ lsof_4.81/lsof_4.81_src/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
 @@ -616,6 +616,6 @@
   * zeromem is a macro that uses bzero or memset.
   */

Modified: trunk/buildroot/package/lsof/lsof-uclibc.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-uclibc.patch	2008-10-23 15:07:34 UTC (rev 23772)
+++ trunk/buildroot/package/lsof/lsof-uclibc.patch	2008-10-23 18:54:10 UTC (rev 23773)
@@ -1,6 +1,6 @@
-diff -ru lsof_4.80.orig/lsof_4.80_src/dialects/linux/dlsof.h lsof_4.80/lsof_4.80_src/dialects/linux/dlsof.h
---- lsof_4.80.orig/lsof_4.80_src/dialects/linux/dlsof.h	2006-03-28 00:57:14.000000000 +0200
-+++ lsof_4.80/lsof_4.80_src/dialects/linux/dlsof.h	2006-11-29 14:03:07.000000000 +0100
+diff -ru lsof_4.81.orig/lsof_4.81_src/dialects/linux/dlsof.h lsof_4.81/lsof_4.81_src/dialects/linux/dlsof.h
+--- lsof_4.81.orig/lsof_4.81_src/dialects/linux/dlsof.h	2006-03-28 00:57:14.000000000 +0200
++++ lsof_4.81/lsof_4.81_src/dialects/linux/dlsof.h	2006-11-29 14:03:07.000000000 +0100
 @@ -49,7 +49,7 @@
  #include <unistd.h>
  #include <netinet/in.h>

Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2008-10-23 15:07:34 UTC (rev 23772)
+++ trunk/buildroot/package/lsof/lsof.mk	2008-10-23 18:54:10 UTC (rev 23773)
@@ -3,7 +3,7 @@
 # lsof
 #
 #############################################################
-LSOF_VERSION:=4.80
+LSOF_VERSION:=4.81
 LSOF_SOURCE:=lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 LSOF_CAT:=$(BZCAT)
