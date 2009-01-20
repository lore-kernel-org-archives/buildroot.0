From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 19:26:55 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20090120192656.5959476850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-20 19:26:54 +0000 (Tue, 20 Jan 2009)
New Revision: 24924

Log:
busybox: 1.13.2 tar fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch	2009-01-20 19:26:54 UTC (rev 24924)
@@ -0,0 +1,11 @@
+--- busybox-1.13.2/archival/tar.c	Sun Nov  9 18:28:02 2008
++++ busybox-1.13.2-tar/archival/tar.c	Tue Jan 20 03:52:04 2009
+@@ -591,8 +591,6 @@
+ 	struct TarBallInfo tbInfo;
+ 
+ 	tbInfo.hlInfoHead = NULL;
+-
+-	fchmod(tar_fd, 0644);
+ 	tbInfo.tarFd = tar_fd;
+ 	tbInfo.verboseFlag = verboseFlag;
+ 
