From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 25 Sep 2007 04:56:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mplayer
Message-ID: <20070925115634.8FACA3006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-25 04:56:34 -0700 (Tue, 25 Sep 2007)
New Revision: 20011

Log:
Fix LEGACY dependencies for mplayer

Added:
   trunk/buildroot/package/mplayer/mplayer-1.0rc1-index.patch


Changeset:
Added: trunk/buildroot/package/mplayer/mplayer-1.0rc1-index.patch
===================================================================
--- trunk/buildroot/package/mplayer/mplayer-1.0rc1-index.patch	                        (rev 0)
+++ trunk/buildroot/package/mplayer/mplayer-1.0rc1-index.patch	2007-09-25 11:56:34 UTC (rev 20011)
@@ -0,0 +1,22 @@
+diff -urN MPlayer-1.0rc1-0rig/stream/stream_dvb.c MPlayer-1.0rc1/stream/stream_dvb.c
+--- MPlayer-1.0rc1-0rig/stream/stream_dvb.c	2006-10-23 00:32:25.000000000 +0200
++++ MPlayer-1.0rc1/stream/stream_dvb.c	2007-09-25 08:37:54.000000000 +0200
+@@ -37,9 +37,7 @@
+ #include <sys/poll.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+-#include <string.h>
+ #include <errno.h>
+-#include <fcntl.h>
+ 
+ #include "stream.h"
+ #include "libmpdemux/demuxer.h"
+@@ -168,7 +166,7 @@
+ 		if((line[0] == '#') || (strlen(line) == 0))
+ 			continue;
+ 
+-		colon = index(line, ':');
++		colon = strchr(line, ':');
+ 		if(colon)
+ 		{
+ 			k = colon - line;
