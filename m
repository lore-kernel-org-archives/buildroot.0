From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Mon, 26 Jan 2009 10:16:09 +0100
Subject: [Buildroot] [PATCH 1/2] mplayer: add patch due to missing
	sys/timeb.h
Message-ID: <200901261016.09333.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This include file is only available, if uClibc is compiled with
UCLIBC_SUSV3_LEGACY defined and ftime() is not needed in this part of
mplayer at all.

This solves the following compiler error:
win32.c:67:23: error: sys/timeb.h: No such file or directory

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 .../mplayer/mplayer-1.0rc1-remove-sys-timeb.patch  |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch

diff --git a/package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch b/package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch
new file mode 100644
index 0000000..369aa70
--- /dev/null
+++ b/package/multimedia/mplayer/mplayer-1.0rc1-remove-sys-timeb.patch
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
-- 
1.6.1.1.227.g86702
