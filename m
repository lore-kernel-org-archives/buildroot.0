From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Apr 2007 00:11:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070425071110.8721048002@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-25 00:11:10 -0700 (Wed, 25 Apr 2007)
New Revision: 18518

Log:
sed patch

Added:
   trunk/buildroot/package/busybox/busybox-1.5.0-sed.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.5.0-sed.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.5.0-sed.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.5.0-sed.patch	2007-04-25 07:11:10 UTC (rev 18518)
@@ -0,0 +1,11 @@
+--- busybox-1.5.0/editors/sed.c	Thu Mar 22 22:21:38 2007
++++ busybox-1.5.0-sed/editors/sed.c	Fri Apr 13 22:10:24 2007
+@@ -481,7 +481,7 @@
+ 	if (bbg.add_cmd_line) {
+ 		char *tp = xasprintf("%s\n%s", bbg.add_cmd_line, cmdstr);
+ 		free(bbg.add_cmd_line);
+-		bbg.add_cmd_line = tp;
++		cmdstr = bbg.add_cmd_line = tp;
+ 	}
+ 
+ 	/* If this line ends with backslash, request next line. */
