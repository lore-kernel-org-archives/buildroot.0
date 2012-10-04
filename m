From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 23:26:56 +0200
Subject: [Buildroot] [git commit] mplayer: Fix external libdvdread and
	libdvdnav support
Message-ID: <20121004212758.DF0BF997BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63fbc1834f98f37cc43514f13cb75c1034dcf454
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This sets paths to dvdread-config and dvdnav-config,
and configuration options to enable external libdvdread
and libdvdnav support.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 05120bf..9ff4b8a 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -42,6 +42,21 @@ else
 MPLAYER_CONF_OPTS += --disable-freetype
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
+MPLAYER_CONF_OPTS +=  \
+	--enable-dvdread \
+	--disable-dvdread-internal \
+	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
+MPLAYER_DEPENDENCIES += libdvdread
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
+MPLAYER_CONF_OPTS +=  \
+	--enable-dvdnav \
+	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
+MPLAYER_DEPENDENCIES += libdvdnav
+endif
+
 ifeq ($(BR2_PACKAGE_MPLAYER_MPLAYER),y)
 MPLAYER_CONF_OPTS += --enable-mplayer
 else
