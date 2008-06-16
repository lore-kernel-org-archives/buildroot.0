From: Conrad Parker <conrad@metadecks.org>
Date: Mon, 16 Jun 2008 14:27:20 +0900
Subject: [Buildroot] [PATCH] update package/lsof for lsof-4.80 in lsof.mk
	and lsof-*.patch
Message-ID: <dba6c0830806152227m7995f83arf8c479b725202101@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patch updates package/lsof to build the current version.
(The previous one no longer exists on the upstream server).

Conrad.

---
 package/lsof/lsof-makefile.patch                |    6 +++---
 package/lsof/lsof-noportmap.patch               |    4 ++--
 package/lsof/lsof-remove-susvlegacy-funcs.patch |    6 +++---
 package/lsof/lsof-uclibc.patch                  |    6 +++---
 package/lsof/lsof.mk                            |    2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/lsof/lsof-makefile.patch b/package/lsof/lsof-makefile.patch
index 9a655b3..66f5027 100644
--- a/package/lsof/lsof-makefile.patch
+++ b/package/lsof/lsof-makefile.patch
@@ -1,6 +1,6 @@
-diff -ru lsof_4.77.orig/lsof_4.77_src/lib/Makefile.skel
lsof_4.77/lsof_4.77_src/lib/Makefile.skel
---- lsof_4.77.orig/lsof_4.77_src/lib/Makefile.skel	2001-02-13
03:12:22.000000000 +0100
-+++ lsof_4.77/lsof_4.78_src/lib/Makefile.skel	2006-11-29
13:51:44.000000000 +0100
+diff -ru lsof_4.80.orig/lsof_4.80_src/lib/Makefile.skel
lsof_4.80/lsof_4.80_src/lib/Makefile.skel
+--- lsof_4.80.orig/lsof_4.80_src/lib/Makefile.skel	2001-02-13
03:12:22.000000000 +0100
++++ lsof_4.80/lsof_4.78_src/lib/Makefile.skel	2006-11-29
13:51:44.000000000 +0100
 @@ -21,8 +21,8 @@
  all:	${LIB}

diff --git a/package/lsof/lsof-noportmap.patch
b/package/lsof/lsof-noportmap.patch
index 0ff39f7..bc6dee0 100644
--- a/package/lsof/lsof-noportmap.patch
+++ b/package/lsof/lsof-noportmap.patch
@@ -1,5 +1,5 @@
---- lsof_4.77/lsof_4.77_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
-+++ lsof_4.77/lsof_4.78_src/print.c	2006-08-23 13:38:29.000000000 -0600
+--- lsof_4.80/lsof_4.80_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
++++ lsof_4.80/lsof_4.80_src/print.c	2006-08-23 13:38:29.000000000 -0600
 @@ -148,6 +148,7 @@
  static void
  fill_portmap()
diff --git a/package/lsof/lsof-remove-susvlegacy-funcs.patch
b/package/lsof/lsof-remove-susvlegacy-funcs.patch
index b2fdfb4..cac3f83 100644
--- a/package/lsof/lsof-remove-susvlegacy-funcs.patch
+++ b/package/lsof/lsof-remove-susvlegacy-funcs.patch
@@ -1,6 +1,6 @@
-diff -rdup lsof_4.78.orig/lsof_4.78_src/dialects/linux/machine.h
lsof_4.78/lsof_4.78_src/dialects/linux/machine.h
---- lsof_4.78.orig/lsof_4.78_src/dialects/linux/machine.h	2007-04-24
18:20:58.000000000 +0200
-+++ lsof_4.78/lsof_4.78_src/dialects/linux/machine.h	2007-05-15
12:17:03.000000000 +0200
+diff -rdup lsof_4.80.orig/lsof_4.80_src/dialects/linux/machine.h
lsof_4.80/lsof_4.80_src/dialects/linux/machine.h
+--- lsof_4.80.orig/lsof_4.80_src/dialects/linux/machine.h	2007-04-24
18:20:58.000000000 +0200
++++ lsof_4.80/lsof_4.80_src/dialects/linux/machine.h	2007-05-15
12:17:03.000000000 +0200
 @@ -616,6 +616,6 @@
   * zeromem is a macro that uses bzero or memset.
   */
diff --git a/package/lsof/lsof-uclibc.patch b/package/lsof/lsof-uclibc.patch
index 8fd90d8..d130bfd 100644
--- a/package/lsof/lsof-uclibc.patch
+++ b/package/lsof/lsof-uclibc.patch
@@ -1,6 +1,6 @@
-diff -ru lsof_4.77.orig/lsof_4.77_src/dialects/linux/dlsof.h
lsof_4.77/lsof_4.77_src/dialects/linux/dlsof.h
---- lsof_4.77.orig/lsof_4.77_src/dialects/linux/dlsof.h	2006-03-28
00:57:14.000000000 +0200
-+++ lsof_4.77/lsof_4.78_src/dialects/linux/dlsof.h	2006-11-29
14:03:07.000000000 +0100
+diff -ru lsof_4.80.orig/lsof_4.80_src/dialects/linux/dlsof.h
lsof_4.80/lsof_4.80_src/dialects/linux/dlsof.h
+--- lsof_4.80.orig/lsof_4.80_src/dialects/linux/dlsof.h	2006-03-28
00:57:14.000000000 +0200
++++ lsof_4.80/lsof_4.80_src/dialects/linux/dlsof.h	2006-11-29
14:03:07.000000000 +0100
 @@ -49,7 +49,7 @@
  #include <unistd.h>
  #include <netinet/in.h>
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 562e845..659f858 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -3,7 +3,7 @@
 # lsof
 #
 #############################################################
-LSOF_VERSION:=4.78
+LSOF_VERSION:=4.80
 LSOF_SOURCE:=lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 LSOF_CAT:=$(BZCAT)
-- 
1.5.4.3
