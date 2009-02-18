From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Feb 2009 14:16:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20090218141631.76BC876A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-18 14:16:30 +0000 (Wed, 18 Feb 2009)
New Revision: 25362

Log:
busybox: 1.13.2 killall fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch	2009-02-18 14:16:30 UTC (rev 25362)
@@ -0,0 +1,17 @@
+--- busybox-1.13.2/include/libbb.h	Wed Dec 31 04:06:45 2008
++++ busybox-1.13.2-killall/include/libbb.h	Sat Feb 14 02:41:18 2009
+@@ -1275,7 +1275,13 @@
+ 	PSSCAN_UTIME    = 1 << 13,
+ 	PSSCAN_TTY      = 1 << 14,
+ 	PSSCAN_SMAPS	= (1 << 15) * ENABLE_FEATURE_TOPMEM,
+-	PSSCAN_ARGVN    = (1 << 16) * (ENABLE_PGREP || ENABLE_PKILL || ENABLE_PIDOF),
++	/* NB: used by find_pid_by_name(). Any applet using it
++	 * needs to be mentioned here. */
++	PSSCAN_ARGVN    = (1 << 16) * (ENABLE_KILLALL
++				|| ENABLE_PGREP || ENABLE_PKILL
++				|| ENABLE_PIDOF
++				|| ENABLE_SESTATUS 
++				),
+ 	USE_SELINUX(PSSCAN_CONTEXT = 1 << 17,)
+ 	PSSCAN_START_TIME = 1 << 18,
+ 	PSSCAN_CPU      = 1 << 19,
