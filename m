From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 16 Feb 2007 07:19:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070216151950.B1293485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-16 07:19:49 -0800 (Fri, 16 Feb 2007)
New Revision: 17908

Log:
- just reading the first 9 bytes for the maj:min ought to be enough (TM)


Added:
   trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch	2007-02-16 15:19:49 UTC (rev 17908)
@@ -0,0 +1,13 @@
+Index: busybox/util-linux/mdev.c
+===================================================================
+--- busybox/util-linux/mdev.c	(revision 17891)
++++ busybox/util-linux/mdev.c	(working copy)
+@@ -39,7 +39,7 @@
+ 
+ 	if (!delete) {
+ 		strcat(path, "/dev");
+-		len = open_read_close(path, temp + 1, 64);
++		len = open_read_close(path, temp + 1, 9);
+ 		*temp++ = 0;
+ 		if (len < 1) return;
+ 	}
