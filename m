From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Oct 2014 20:13:30 +0200
Subject: [Buildroot] [PATCH 8/8] package/tvheadend: Add transcoding support
	by ffmpeg
In-Reply-To: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413137610-21887-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 7d27edc..5267a10 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE),yy)
+TVHEADEND_DEPENDENCIES += ffmpeg
+TVHEADEND_CONF_OPTS += --enable-libav
+else
+TVHEADEND_CONF_OPTS += --disable-libav
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-dvbcsa
-- 
1.7.10.4
