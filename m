From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Aug 2015 16:20:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: Add optional dependencies
In-Reply-To: <1438438841-31219-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438438841-31219-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438438841-31219-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 60 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 54c9f52..5fc2d57 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -51,13 +51,9 @@ FFMPEG_CONF_OPTS = \
 	--disable-libdc1394 \
 	--disable-libfaac \
 	--disable-libgsm \
-	--disable-libmp3lame \
 	--disable-libnut \
 	--disable-libopenjpeg \
-	--disable-librtmp \
 	--disable-libschroedinger \
-	--disable-libspeex \
-	--disable-libtheora \
 	--disable-libvo-aacenc \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
@@ -234,6 +230,62 @@ else
 FFMPEG_CONF_OPTS += --disable-libvpx
 endif
 
+ifeq ($(BR2_PACKAGE_LIBASS),y)
+FFMPEG_CONF_OPTS += --enable-libass
+FFMPEG_DEPENDENCIES += libass
+else
+FFMPEG_CONF_OPTS += --disable-libass
+endif
+
+ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
+FFMPEG_CONF_OPTS += --enable-libbluray
+FFMPEG_DEPENDENCIES += libbluray
+else
+FFMPEG_CONF_OPTS += --disable-libbluray
+endif
+
+ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
+FFMPEG_CONF_OPTS += --enable-librtmp
+FFMPEG_DEPENDENCIES += rtmpdump
+else
+FFMPEG_CONF_OPTS += --disable-librtmp
+endif
+
+ifeq ($(BR2_PACKAGE_LAME),y)
+FFMPEG_CONF_OPTS += --enable-libmp3lame
+FFMPEG_DEPENDENCIES += lame
+else
+FFMPEG_CONF_OPTS += --disable-libmp3lame
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+FFMPEG_CONF_OPTS += --enable-libmodplug
+FFMPEG_DEPENDENCIES += libmodplug
+else
+FFMPEG_CONF_OPTS += --disable-libmodplug
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+FFMPEG_CONF_OPTS += --enable-libspeex
+FFMPEG_DEPENDENCIES += speex
+else
+FFMPEG_CONF_OPTS += --disable-libspeex
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
+FFMPEG_CONF_OPTS += --enable-libtheora
+FFMPEG_DEPENDENCIES += libtheora
+else
+FFMPEG_CONF_OPTS += --disable-libtheora
+endif
+
+ifeq ($(BR2_PACKAGE_WAVPACK),y)
+FFMPEG_CONF_OPTS += --enable-libwavpack
+FFMPEG_DEPENDENCIES += wavpack
+else
+FFMPEG_CONF_OPTS += --disable-libwavpack
+endif
+
 # ffmpeg freetype support require fenv.h which is only
 # available/working on glibc.
 # The microblaze variant doesn't provide the needed exceptions
-- 
2.1.4
