From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:25:55 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: Add optional dependencies
Message-ID: <20151014212610.6031B8191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c14259dda1c299c39da8f11f54801ae8b4027ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |   60 ++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index fd953d6..f361970 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -53,13 +53,9 @@ FFMPEG_CONF_OPTS = \
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
@@ -236,6 +232,62 @@ else
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
