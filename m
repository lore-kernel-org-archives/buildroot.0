From: Valentine Barshak <gvaxon@gmail.com>
Date: Wed, 26 Sep 2012 23:34:51 +0400
Subject: [Buildroot] [PATCH 3/3] mplayer: Fix external libdvdread and
	libdvdnav support
In-Reply-To: <20120926193155.GA3942@gmail.com>
Message-ID: <20120926193451.GA3983@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets paths to dvdread-config and dvdnav-config,
and configuration options to enable external libdvdread
and libdvdnav support.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/multimedia/mplayer/mplayer.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
-- 
1.7.11.4
