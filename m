From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 08:42:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [25888] trunk/buildroot/package/busybox
Message-ID: <20090330084204.25A9C775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 08:42:03 +0000 (Mon, 30 Mar 2009)
New Revision: 25888

Log:
busybox: 1.13.3 tail fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.3-tail.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.3-tail.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.3-tail.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.3-tail.patch	2009-03-30 08:42:03 UTC (rev 25888)
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.13.3/coreutils/tail.c busybox-1.13.3-tail/coreutils/tail.c
+--- busybox-1.13.3/coreutils/tail.c	2009-02-26 12:47:02.000000000 +0100
++++ busybox-1.13.3-tail/coreutils/tail.c	2009-03-27 03:34:57.000000000 +0100
+@@ -104,7 +104,7 @@ int tail_main(int argc, char **argv)
+ 	if (argv[1] && (argv[1][0] == '+' || argv[1][0] == '-')
+ 	 && isdigit(argv[1][1])
+ 	) {
+-		count = eat_num(&argv[1][1]);
++		count = eat_num(argv[1]);
+ 		argv++;
+ 		argc--;
+ 	}
