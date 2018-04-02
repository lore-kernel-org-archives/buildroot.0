From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 11:34:32 +0200
Subject: [Buildroot] [git commit] ffmpeg: libcdio support through
 libcdio-paranoia
Message-ID: <20180402093433.A337C8397D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f66bd4805d34e898781e5aca6e7d429cbc2265d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
