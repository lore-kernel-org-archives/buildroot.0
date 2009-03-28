From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 28 Mar 2009 13:10:17 +0000 (UTC)
Subject: [Buildroot] svn commit: [25855]
	trunk/buildroot/package/multimedia/mplayer
Message-ID: <20090328131017.680097743B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-28 13:10:17 +0000 (Sat, 28 Mar 2009)
New Revision: 25855

Log:
mplayer: disable LIVE555 Streaming Media

LIVE555 was installed on the build system and was recognized by configure:
Checking for LIVE555 Streaming Media libraries ... yes (using distribution version)

Later this led to a linker error:
ld: cannot find -lliveMedia

Disable LIVE555, since it's not available in Buildroot.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2009-03-28 13:02:11 UTC (rev 25854)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2009-03-28 13:10:17 UTC (rev 25855)
@@ -63,6 +63,7 @@
 		--disable-mpdvdkit \
 		--disable-ivtv \
 		--disable-tv \
+		--disable-live \
 		--enable-dynamic-plugins \
 	)
 	touch $@
