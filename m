From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:43:19 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: add optional support for
 openjpeg
Message-ID: <20171218094601.A409C815F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee4d8c6d665e4da3140d35eb86225b419c2a68e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5bb5d1e..daa6dab 100644
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
