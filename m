From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  4 Dec 2008 05:21:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081204132136.EB07B3C812@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-04 05:21:36 -0800 (Thu, 04 Dec 2008)
New Revision: 24260

Log:
busybox: 1.13.1 ip fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch	2008-12-04 13:21:36 UTC (rev 24260)
@@ -0,0 +1,11 @@
+--- busybox-1.13.1/networking/ip.c	Sun Nov  9 18:27:59 2008
++++ busybox-1.13.1-ip/networking/ip.c	Thu Dec  4 13:16:29 2008
+@@ -31,7 +31,7 @@
+ 
+ static int ip_do(int (*ip_func)(char **argv), char **argv)
+ {
+-	argv = ip_parse_common_args(argv);
++	argv = ip_parse_common_args(argv + 1);
+ 	return ip_func(argv);
+ }
+ 
