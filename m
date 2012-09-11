From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Sep 2012 22:50:05 +0200
Subject: [Buildroot] [git commit] package: add opus audio codec library
Message-ID: <20120912073358.E363B99621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c226de26ec1379a88f7fe0e278ceb5888b92a054
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/opus/Config.in |   15 +++++++++++++++
 package/opus/opus.mk   |   16 ++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 441159d..2e3f676 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -302,6 +302,7 @@ source "package/libreplaygain/Config.in"
 source "package/libsamplerate/Config.in"
 source "package/libsndfile/Config.in"
 source "package/libvorbis/Config.in"
+source "package/opus/Config.in"
 source "package/portaudio/Config.in"
 source "package/speex/Config.in"
 source "package/taglib/Config.in"
diff --git a/package/opus/Config.in b/package/opus/Config.in
new file mode 100644
index 0000000..12bdfbb
--- /dev/null
+++ b/package/opus/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_OPUS
+	bool "opus"
+	help
+	  The Opus codec is designed for interactive speech and audio
+	  transmission over the Internet. It is designed by the IETF
+	  Codec Working Group and incorporates technology from Skype's
+	  SILK codec and Xiph.Org's CELT codec.
+
+	  It is intended to suit a wide range of interactive audio
+	  applications, including Voice over IP, videoconferencing,
+	  in-game chat, and even remote live music performances. It
+	  can scale from low bit-rate narrowband speech to very high
+	  quality stereo music.
+
+	  http://opus-codec.org
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
new file mode 100644
index 0000000..177adfb
--- /dev/null
+++ b/package/opus/opus.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# opus
+#
+#############################################################
+
+OPUS_VERSION = 1.0.1
+OPUS_SITE = http://downloads.xiph.org/releases/opus
+OPUS_INSTALL_STAGING = YES
+OPUS_CONF_OPT = --disable-doc
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+OPUS_CONF_OPT += --enable-fixed-point
+endif
+
+$(eval $(autotools-package))
