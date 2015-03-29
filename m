From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:26 +0200
Subject: [Buildroot] [PATCH 10/18] package/mplayer: add optional lzo support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 6fbdd72..a09cf43 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -156,6 +156,13 @@ MPLAYER_DEPENDENCIES += giflib
 MPLAYER_EXTRA_LIBS += -lgif
 endif
 
+ifeq ($(BR2_PACKAGE_LZO),y)
+MPLAYER_DEPENDENCIES += lzo
+MPLAYER_CONF_OPTS += --enable-liblzo
+else
+MPLAYER_CONF_OPTS += --disable-liblzo
+endif
+
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
-- 
1.7.10.4
