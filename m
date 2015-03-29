From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:18 +0200
Subject: [Buildroot] [PATCH 02/18] package/mplayer: add optional giflib
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 192a42e..f004ca9 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -100,6 +100,11 @@ else
 MPLAYER_CONF_OPTS += --disable-live
 endif
 
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+MPLAYER_DEPENDENCIES += giflib
+MPLAYER_EXTRA_LIBS += -lgif
+endif
+
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
@@ -145,6 +150,7 @@ define MPLAYER_CONFIGURE_CMDS
 		--yasm='' \
 		--enable-fbdev \
 		$(MPLAYER_CONF_OPTS) \
+		--extra-libs="$(MPLAYER_EXTRA_LIBS)" \
 		--enable-cross-compile \
 		--disable-ivtv \
 		--enable-dynamic-plugins \
-- 
1.7.10.4
