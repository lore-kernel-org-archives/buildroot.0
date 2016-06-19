From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 18:20:27 +0200
Subject: [Buildroot] [PATCH 5/7] package/mplayer: adjust configure options
	to updated libdvdread/libdvdnav
In-Reply-To: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466353229-12798-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 9ae7ca4..541dd4f 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -123,7 +123,7 @@ MPLAYER_CONF_OPTS += --disable-libcdio
 # autodetection find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
-	--with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
+	--with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 MPLAYER_DEPENDENCIES += libdvdread
 endif
 
@@ -131,7 +131,7 @@ endif
 # find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
 MPLAYER_CONF_OPTS +=  \
-	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
+	--with-dvdnav-config="$(PKG_CONFIG_HOST_BINARY) dvdnav"
 MPLAYER_DEPENDENCIES += libdvdnav
 endif
 
-- 
2.8.1
