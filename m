From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 09:22:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20090126092249.54682768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 09:22:47 +0000 (Mon, 26 Jan 2009)
New Revision: 25046

Log:
mplayer: add patch due to missing sys/timeb.h

This include file is only available, if uClibc is compiled with
UCLIBC_SUSV3_LEGACY defined and ftime() is not needed in this part of
mplayer at all.

This solves the following compiler error:
win32.c:67:23: error: sys/timeb.h: No such file or directory

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Added:
   trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch


Changeset:
Added: trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch	2009-01-26 09:22:47 UTC (rev 25046)
@@ -0,0 +1,12 @@
+win32.c:67:23: error: sys/timeb.h: No such file or directory
+
+--- a/loader/win32.c	2009-01-26 01:53:20.000000000 +0100
++++ b/loader/win32.c	2009-01-26 01:53:39.000000000 +0100
+@@ -64,7 +64,6 @@
+ #include <sys/types.h>
+ #include <dirent.h>
+ #include <sys/time.h>
+-#include <sys/timeb.h>
+ #ifdef	HAVE_KSTAT
+ #include <kstat.h>
+ #endif
