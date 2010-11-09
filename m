From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Tue, 09 Nov 2010 07:52:13 -0800
Subject: [Buildroot] Buildroot Patches I Use [4] - Lockfile-progs patch fix
Message-ID: <1289317933.30565.118.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes a patch in the lockfile-progs package.  (Fixes a bogus path
and allows warnings during make since this tends to crop up depending on
what GCC version you build with).  This may be appropriate for 2010.11.


Signed-off by: Darcy Watkins <dwatkins@tranzeo.com>



Index: buildroot-2010.11_powerpc/package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch
===================================================================
--- buildroot-2010.11_powerpc.orig/package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch
+++ buildroot-2010.11_powerpc/package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch
@@ -1,6 +1,6 @@
---- /lockfile-progs.orig.c	2007-10-11 10:32:09.000000000 -0300
-+++ /lockfile-progs.c	2007-10-11 10:32:28.000000000 -0300
-@@ -93,7 +93,7 @@
+--- lockfile-progs-0.1.15/lockfile-progs.c.orig	2010-06-08 22:27:30.000000000 -0700
++++ lockfile-progs-0.1.15/lockfile-progs.c	2010-11-03 14:10:08.000000000 -0700
+@@ -134,7 +134,7 @@ parse_arguments(const int argc, char *ar
      { NULL, 0, NULL, 0 }
    };
  
@@ -9,3 +9,13 @@
    int mail_cmd_p = 0;
  
    if(cmd_name != NULL) {
+--- lockfile-progs-0.1.15/Makefile.orig	2009-06-21 10:01:51.000000000 -0700
++++ lockfile-progs-0.1.15/Makefile	2010-11-03 14:17:42.000000000 -0700
+@@ -1,6 +1,6 @@
+ 
+ LOADLIBES := -llockfile
+-CFLAGS    := -g -Wall -Wformat-security -Werror -O2
++CFLAGS    := -g -Wall -Wformat-security -O2
+ 
+ all: lockfile-create
+ 	rm -rf bin
