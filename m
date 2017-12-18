From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Dec 2017 07:29:11 +0100
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: add optional support for
 openjpeg
In-Reply-To: <20171218062911.14366-1-bernd.kuhls@t-online.de>
References: <20171218062911.14366-1-bernd.kuhls@t-online.de>
Message-ID: <20171218062911.14366-2-bernd.kuhls@t-online.de>
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
index 5bb5d1e30e..daa6daba1b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -53,7 +53,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libdc1394 \
 	--disable-libgsm \
 	--disable-libilbc \
-	--disable-libopenjpeg \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
 	--disable-doc
@@ -369,6 +368,13 @@ else
 FFMPEG_CONF_OPTS += --disable-fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+FFMPEG_CONF_OPTS += --enable-libopenjpeg
+FFMPEG_DEPENDENCIES += openjpeg
+else
+FFMPEG_CONF_OPTS += --disable-libopenjpeg
+endif
+
 ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
 FFMPEG_CONF_OPTS += --enable-libx264
 FFMPEG_DEPENDENCIES += x264
-- 
2.11.0
