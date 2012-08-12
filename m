From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:55 +0200
Subject: [Buildroot] [PATCH 07/36] package/celt051: new package
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-7-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/multimedia/Config.in         |    1 +
 package/multimedia/celt051/Config.in |   15 +++++++++++++++
 package/multimedia/celt051/celt.mk   |   26 ++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/celt051/Config.in
 create mode 100644 package/multimedia/celt051/celt.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index afe4a23..b641b51 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -2,6 +2,7 @@ menu "Audio and video applications"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/bellagio/Config.in"
+source "package/multimedia/celt051/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
diff --git a/package/multimedia/celt051/Config.in b/package/multimedia/celt051/Config.in
new file mode 100644
index 0000000..50ed069
--- /dev/null
+++ b/package/multimedia/celt051/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CELT051
+	bool "celt051"
+	select BR2_PACKAGE_LIBOGG
+	help
+	  The CELT ultra-low delay audio codec
+	  
+	  The CELT codec is a compression algorithm for audio. Like MP3,
+	  Vorbis, and AAC it is suitable for transmitting music with high
+	  quality. Unlike these formats CELT imposes very little delay on
+	  the signal, even less than is typical for speech centric formats
+	  like Speex, GSM, or G.729.
+	  
+	  Note: this is version 0.5.1.3 of celt.
+	  
+	  http://www.celt-codec.org/
diff --git a/package/multimedia/celt051/celt.mk b/package/multimedia/celt051/celt.mk
new file mode 100644
index 0000000..e5b87c5
--- /dev/null
+++ b/package/multimedia/celt051/celt.mk
@@ -0,0 +1,26 @@
+#-----------------------------------------------------------------------------
+# Package description
+
+# Although version newer than 0.5.1.3 exists, we're
+# stuck with 0.5.1.3 for use by Spice (coming later)
+CELT051_VERSION         = 0.5.1.3
+CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz
+CELT051_SITE            = http://downloads.xiph.org/releases/celt
+CELT051_LICENSE         = BSD-2c
+CELT051_LICENSE_FILES   = COPYING
+CELT051_INSTALL_STAGING = YES
+CELT051_DEPENDENCIES    = libogg
+
+#----------------------------------------------------------------------------
+# Package build process
+
+
+CELT051_CONF_OPT =                  \
+  --enable-fixed-point              \
+  --disable-fixed-point-debug       \
+  --disable-experimental-postfilter \
+  --disable-static-modes            \
+  --disable-assertions              \
+  --disable-oggtest                 \
+
+$(eval $(autotools-package))
-- 
1.7.2.5
