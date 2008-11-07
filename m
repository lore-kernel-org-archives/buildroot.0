From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Nov 2008 02:16:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081107101655.B4F943C952@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-07 02:16:55 -0800 (Fri, 07 Nov 2008)
New Revision: 23957

Log:
busybox: basename 1.12.1 fix

Added:
   trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-basename.patch	2008-11-07 10:16:55 UTC (rev 23957)
@@ -0,0 +1,10 @@
+diff -urpN busybox-1.12.1/coreutils/basename.c busybox-1.12.1-basename/coreutils/basename.c
+--- busybox-1.12.1/coreutils/basename.c	2008-09-28 20:04:18.000000000 +0200
++++ busybox-1.12.1-basename/coreutils/basename.c	2008-11-06 16:10:54.000000000 +0100
+@@ -48,5 +48,5 @@ int basename_main(int argc, char **argv)
+ 
+ 	/* puts(s) will do, but we can do without stdio this way: */
+ 	s[m++] = '\n';
+-	return full_write(STDOUT_FILENO, s, m) == (ssize_t)m;
++	return full_write(STDOUT_FILENO, s, m) != (ssize_t)m;
+ }
