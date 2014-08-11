From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 11 Aug 2014 13:42:53 +0200
Subject: [Buildroot] [PATCH 3/4] mpd: Set enable/disable config option for
	all plugins
In-Reply-To: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
References: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
Message-ID: <1407757374-7456-4-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/mpd.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index cddcfb2..2c2f74f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -21,6 +21,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
 MPD_DEPENDENCIES += alsa-lib
+MPD_CONF_OPT += --enable-alsa
 else
 MPD_CONF_OPT += --disable-alsa
 endif
@@ -28,91 +29,111 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_AO),y)
 MPD_DEPENDENCIES += libao
 MPD_CONF_OPT += --enable-ao
+else
+MPD_CONF_OPT += --disable-ao
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_AUDIOFILE),y)
 MPD_DEPENDENCIES += audiofile
 MPD_CONF_OPT += --enable-audiofile
+else
+MPD_CONF_OPT += --disable-audiofile
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
 MPD_DEPENDENCIES += pulseaudio
 MPD_CONF_OPT += --enable-pulse
+else
+MPD_CONF_OPT += --disable-pulse
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
 MPD_DEPENDENCIES += bzip2
 MPD_CONF_OPT += --enable-bzip2
+else
+MPD_CONF_OPT += --disable-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
+MPD_CONF_OPT += --enable-aac
 else
 MPD_CONF_OPT += --disable-aac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
+MPD_CONF_OPT += --enable-flac
 else
 MPD_CONF_OPT += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
 MPD_DEPENDENCIES += libcurl
+MPD_CONF_OPT += --enable-curl
 else
 MPD_CONF_OPT += --disable-curl
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LAME),y)
 MPD_DEPENDENCIES += lame
+MPD_CONF_OPT += --enable-lame-encoder
 else
 MPD_CONF_OPT += --disable-lame-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
 MPD_DEPENDENCIES += libsamplerate
+MPD_CONF_OPT += --enable-lsr
 else
 MPD_CONF_OPT += --disable-lsr
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSNDFILE),y)
 MPD_DEPENDENCIES += libsndfile
+MPD_CONF_OPT += --enable-sndfile
 else
 MPD_CONF_OPT += --disable-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
 MPD_DEPENDENCIES += opus
+MPD_CONF_OPT += --enable-opus
 else
 MPD_CONF_OPT += --disable-opus
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
+MPD_CONF_OPT += --enable-vorbis --enable-vorbis-encoder
 else
 MPD_CONF_OPT += --disable-vorbis --disable-vorbis-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
 MPD_DEPENDENCIES += libid3tag mpg123
+MPD_CONF_OPT += --enable-mpg123
 else
 MPD_CONF_OPT += --disable-mpg123
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MUSEPACK),y)
 MPD_DEPENDENCIES += musepack
+MPD_CONF_OPT += --enable-mpc
 else
 MPD_CONF_OPT += --disable-mpc
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
 MPD_DEPENDENCIES += yajl
+MPD_CONF_OPT += --enable-soundcloud
 else
 MPD_CONF_OPT += --disable-soundcloud
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
 MPD_DEPENDENCIES += sqlite
+MPD_CONF_OPT += --enable-sqlite
 else
 MPD_CONF_OPT += --disable-sqlite
 endif
@@ -129,10 +150,13 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_TWOLAME),y)
 MPD_DEPENDENCIES += twolame
 MPD_CONF_OPT += --enable-twolame-encoder
+else
+MPD_CONF_OPT += --disable-twolame-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_WAVPACK),y)
 MPD_DEPENDENCIES += wavpack
+MPD_CONF_OPT += --enable-wavpack
 else
 MPD_CONF_OPT += --disable-wavpack
 endif
-- 
2.0.4
