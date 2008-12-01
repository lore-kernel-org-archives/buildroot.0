From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 04:32:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20081201123251.46DFF3C374@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 04:32:50 -0800 (Mon, 01 Dec 2008)
New Revision: 24206

Log:
mplayer: disable ivtv video output

This patch disabled ivtv video output, since it does not compile with Linux
kernel 2.6.27 headers.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 11:03:35 UTC (rev 24205)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 12:32:50 UTC (rev 24206)
@@ -45,6 +45,7 @@
 		--enable-fbdev \
 		$(MPLAYER_ENDIAN) \
 		--disable-mpdvdkit \
+		--disable-ivtv \
 		--disable-tv \
 		--enable-dynamic-plugins \
 	)
