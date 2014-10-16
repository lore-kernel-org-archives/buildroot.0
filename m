From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Fri, 17 Oct 2014 00:28:58 +0200
Subject: [Buildroot] [PATCH v3 3/8] package/mpd: sort plugins alphabetically
	in mpd.mk
In-Reply-To: <1413498543-643-1-git-send-email-jkrause@posteo.de>
References: <1413498543-643-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413498543-643-3-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v2 -> v3:
  - none
Changes v1 -> v2:
  - none
---
 package/mpd/mpd.mk | 70 +++++++++++++++++++++++++++---------------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 1542338..b10a60a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -48,13 +48,6 @@ else
 MPD_CONF_OPTS += --disable-audiofile
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
-MPD_DEPENDENCIES += pulseaudio
-MPD_CONF_OPTS += --enable-pulse
-else
-MPD_CONF_OPTS += --disable-pulse
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
 MPD_DEPENDENCIES += bzip2
 MPD_CONF_OPTS += --enable-bzip2
@@ -62,6 +55,13 @@ else
 MPD_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_CURL),y)
+MPD_DEPENDENCIES += libcurl
+MPD_CONF_OPTS += --enable-curl
+else
+MPD_CONF_OPTS += --disable-curl
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
 MPD_CONF_OPTS += --enable-aac
@@ -69,6 +69,13 @@ else
 MPD_CONF_OPTS += --disable-aac
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_FFMPEG),y)
+MPD_DEPENDENCIES += ffmpeg
+MPD_CONF_OPTS += --enable-ffmpeg
+else
+MPD_CONF_OPTS += --disable-ffmpeg
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
 MPD_CONF_OPTS += --enable-flac
@@ -76,13 +83,6 @@ else
 MPD_CONF_OPTS += --disable-flac
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_CURL),y)
-MPD_DEPENDENCIES += libcurl
-MPD_CONF_OPTS += --enable-curl
-else
-MPD_CONF_OPTS += --disable-curl
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_LAME),y)
 MPD_DEPENDENCIES += lame
 MPD_CONF_OPTS += --enable-lame-encoder
@@ -104,20 +104,6 @@ else
 MPD_CONF_OPTS += --disable-sndfile
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
-MPD_DEPENDENCIES += opus libogg
-MPD_CONF_OPTS += --enable-opus
-else
-MPD_CONF_OPTS += --disable-opus
-endif
-
-ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
-MPD_DEPENDENCIES += libvorbis
-MPD_CONF_OPTS += --enable-vorbis --enable-vorbis-encoder
-else
-MPD_CONF_OPTS += --disable-vorbis --disable-vorbis-encoder
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_MAD),y)
 MPD_DEPENDENCIES += libid3tag libmad
 MPD_CONF_OPTS += --enable-mad
@@ -139,6 +125,20 @@ else
 MPD_CONF_OPTS += --disable-mpc
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
+MPD_DEPENDENCIES += opus libogg
+MPD_CONF_OPTS += --enable-opus
+else
+MPD_CONF_OPTS += --disable-opus
+endif
+
+ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
+MPD_DEPENDENCIES += pulseaudio
+MPD_CONF_OPTS += --enable-pulse
+else
+MPD_CONF_OPTS += --disable-pulse
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
 MPD_DEPENDENCIES += yajl
 MPD_CONF_OPTS += --enable-soundcloud
@@ -169,6 +169,13 @@ else
 MPD_CONF_OPTS += --disable-twolame-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
+MPD_DEPENDENCIES += libvorbis
+MPD_CONF_OPTS += --enable-vorbis --enable-vorbis-encoder
+else
+MPD_CONF_OPTS += --disable-vorbis --disable-vorbis-encoder
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_WAVPACK),y)
 MPD_DEPENDENCIES += wavpack
 MPD_CONF_OPTS += --enable-wavpack
@@ -176,13 +183,6 @@ else
 MPD_CONF_OPTS += --disable-wavpack
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_FFMPEG),y)
-MPD_DEPENDENCIES += ffmpeg
-MPD_CONF_OPTS += --enable-ffmpeg
-else
-MPD_CONF_OPTS += --disable-ffmpeg
-endif
-
 define MPD_INSTALL_EXTRA_FILES
 	@if [ ! -f $(TARGET_DIR)/etc/mpd.conf ]; then \
 		$(INSTALL) -D package/mpd/mpd.conf \
-- 
2.1.2
