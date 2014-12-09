From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:33:46 +0100
Subject: [Buildroot] [git commit] package/mpd: fix line length for help text
Message-ID: <20141209183523.AE58980166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c1c333ff6037cbbc120471e4e2dfe0f57714087
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make help text lines not longer as 80 characters (one tab weights
eight chars).

[Thomas: rewrap more help text.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 3435b05..4da9fa5 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -51,7 +51,8 @@ config BR2_PACKAGE_MPD_LIBSOXR
 	select BR2_PACKAGE_LIBSOXR
 	help
 	  Enable libsoxr resampler support.
-	  The SoX Resampler library performs software sample-rate conversion.
+	  The SoX Resampler library performs software sample-rate
+	  conversion.
 
 comment "Decoder plugins"
 
@@ -65,8 +66,8 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 config BR2_PACKAGE_MPD_DSD
 	bool "dsd"
 	help
-	  Enable Digital Speech Decoder (DSD) support to play audio files encoded
-	  in a digital speech format.
+	  Enable Digital Speech Decoder (DSD) support to play audio
+	  files encoded in a digital speech format.
 
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
@@ -82,7 +83,8 @@ config BR2_PACKAGE_MPD_FFMPEG
 	depends on BR2_INET_IPV6
 	help
 	  Enable ffmpeg input support.
-	  Select this if you want to play back files supported by ffmpeg.
+	  Select this if you want to play back files supported by
+	  ffmpeg.
 
 comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
@@ -145,7 +147,8 @@ config BR2_PACKAGE_MPD_TREMOR
 	select BR2_PACKAGE_TREMOR
 	help
 	  Enable vorbis input support.
-	  Select this if you want to play back OGG files on softfloat targets.
+	  Select this if you want to play back OGG files on softfloat
+	  targets.
 
 config BR2_PACKAGE_MPD_VORBIS
 	bool "vorbis"
@@ -153,7 +156,8 @@ config BR2_PACKAGE_MPD_VORBIS
 	select BR2_PACKAGE_LIBVORBIS
 	help
 	  Enable vorbis input/streaming support.
-	  Select this if you want to play back OGG files on hardfloat targets.
+	  Select this if you want to play back OGG files on hardfloat
+	  targets.
 
 config BR2_PACKAGE_MPD_WAVPACK
 	bool "wavpack"
@@ -263,8 +267,9 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	help
 	  Enable Avahi (zeroconf) support.
-	  Select this for multicast DNS/DNS-SD service discovery support. This allows
-	  MPD to publish service information on a local network.
+	  Select this for multicast DNS/DNS-SD service discovery
+	  support. This allows MPD to publish service information on a
+	  local network.
 
 comment "avahi support needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
