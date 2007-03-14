From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 14 Mar 2007 06:02:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070314130209.5E64F48600@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-14 06:02:07 -0700 (Wed, 14 Mar 2007)
New Revision: 18101

Log:
- fix ptr_to_globals


Added:
   trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch	2007-03-14 13:02:07 UTC (rev 18101)
@@ -0,0 +1,11 @@
+Index: busybox/libbb/messages.c
+===================================================================
+--- busybox/libbb/messages.c	(revision 18097)
++++ busybox/libbb/messages.c	(working copy)
+@@ -56,4 +56,5 @@ WTMP_FILE;
+ 
+ char bb_common_bufsiz1[BUFSIZ+1];
+ 
+-void *ptr_to_globals;
++struct global1;
++struct global1 *ptr_to_globals;
