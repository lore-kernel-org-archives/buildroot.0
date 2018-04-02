From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Apr 2018 10:46:17 +0200
Subject: [Buildroot] [PATCH 1/1] ffmpeg: libcdio support through
 libcdio-paranoia
Message-ID: <20180402084617.14182-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5d2f89fb43..71d642cf4c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -49,7 +49,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-frei0r \
 	--disable-libopencore-amrnb \
 	--disable-libopencore-amrwb \
-	--disable-libcdio \
 	--disable-libdc1394 \
 	--disable-libgsm \
 	--disable-libilbc \
@@ -203,6 +202,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libfdk-aac
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_GPL)$(BR2_PACKAGE_LIBCDIO_PARANOIA),yy)
+FFMPEG_CONF_OPTS += --enable-libcdio
+FFMPEG_DEPENDENCIES += libcdio-paranoia
+else
+FFMPEG_CONF_OPTS += --disable-libcdio
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
 FFMPEG_DEPENDENCIES += gnutls
-- 
2.14.1
