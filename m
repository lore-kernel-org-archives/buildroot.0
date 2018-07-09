From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Jul 2018 19:47:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add optional support for
 libdrm
Message-ID: <20180709174744.10857-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 432e4cda09..82140e266e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -231,6 +231,13 @@ ifeq ($(BR2_PACKAGE_FFMPEG_GPL)$(BR2_PACKAGE_LIBEBUR128),yy)
 FFMPEG_DEPENDENCIES += libebur128
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+FFMPEG_CONF_OPTS += --enable-libdrm
+FFMPEG_DEPENDENCIES += libdrm
+else
+FFMPEG_CONF_OPTS += --disable-libdrm
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
 FFMPEG_CONF_OPTS += --enable-libopenh264
 FFMPEG_DEPENDENCIES += libopenh264
-- 
2.18.0
