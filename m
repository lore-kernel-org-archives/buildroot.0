From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  4 Dec 2008 08:49:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20081204164906.9D1953C8F6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-04 08:49:06 -0800 (Thu, 04 Dec 2008)
New Revision: 24275

Log:
mplayer: set charset explisit to US-ASCII to ease intl compile

This patch set the charset selected by mplayer to US-ASCII because mplayer
configure script have problems detecting working cross compiled iconv tools



Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-04 16:47:19 UTC (rev 24274)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-04 16:49:06 UTC (rev 24275)
@@ -41,6 +41,7 @@
 		--as=$(TARGET_CROSS)as \
 		--with-extraincdir=$(STAGING_DIR)/usr/include \
 		--with-extralibdir=$(STAGING_DIR)/lib \
+		--charset=US-ASCII \
 		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_ENDIAN) \
