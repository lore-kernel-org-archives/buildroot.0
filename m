From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Jul 2016 22:49:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add optional support for
	libvdpau
Message-ID: <1467924554-18058-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d5396ad..a4e2be6 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -36,7 +36,6 @@ FFMPEG_CONF_OPTS = \
 	--enable-mdct \
 	--enable-rdft \
 	--disable-crystalhd \
-	--disable-vdpau \
 	--disable-dxva2 \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
@@ -247,6 +246,13 @@ else
 FFMPEG_CONF_OPTS += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
+FFMPEG_CONF_OPTS += --enable-vdpau
+FFMPEG_DEPENDENCIES += libvdpau
+else
+FFMPEG_CONF_OPTS += --disable-vdpau
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 FFMPEG_CONF_OPTS += --enable-libopus
 FFMPEG_DEPENDENCIES += opus
-- 
2.8.1
