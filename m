From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 17 May 2018 20:38:24 +0200
Subject: [Buildroot] [PATCH] libopusenc: new package
Message-ID: <20180517183824.16742-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libopusenc library provides a high-level API for encoding opus audio files
and live streams.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libopusenc/Config.in       |  7 +++++++
 package/libopusenc/libopusenc.hash |  3 +++
 package/libopusenc/libopusenc.mk   | 16 ++++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/libopusenc/Config.in
 create mode 100644 package/libopusenc/libopusenc.hash
 create mode 100644 package/libopusenc/libopusenc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b910a86a8c..7fc7e354d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1045,6 +1045,7 @@ F:	configs/bananapro_defconfig
 F:	package/augeas/
 F:	package/bctoolbox/
 F:	package/freescale-imx/imx-alsa-plugins/
+F:	package/libopusenc/
 F:	package/libshout/
 F:	package/libupnpp/
 F:	package/luv/
diff --git a/package/Config.in b/package/Config.in
index ecee4938c9..1d6ddee8ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1359,6 +1359,7 @@ menu "Multimedia"
 	source "package/libmpeg2/Config.in"
 	source "package/libogg/Config.in"
 	source "package/libopenh264/Config.in"
+	source "package/libopusenc/Config.in"
 	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/libvpx/Config.in"
diff --git a/package/libopusenc/Config.in b/package/libopusenc/Config.in
new file mode 100644
index 0000000000..610aba926e
--- /dev/null
+++ b/package/libopusenc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBOPUSENC
+	bool "libopusenc"
+	help
+	  The libopusenc library provides a high-level API for
+	  encoding opus audio files and live streams.
+
+	  http://opus-codec.org
diff --git a/package/libopusenc/libopusenc.hash b/package/libopusenc/libopusenc.hash
new file mode 100644
index 0000000000..1eea51b6bc
--- /dev/null
+++ b/package/libopusenc/libopusenc.hash
@@ -0,0 +1,3 @@
+# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
+sha256  02e6e0b14cbbe0569d948a46420f9c9a81d93bba32dc576a4007cbf96da68ef3  libopusenc-0.1.1.tar.gz
+sha256  93b17ab56b8230127fea532be0dcb4e6d71e66ab5e8ce5d6ae8785d7288b164f  COPYING
diff --git a/package/libopusenc/libopusenc.mk b/package/libopusenc/libopusenc.mk
new file mode 100644
index 0000000000..0debe85c71
--- /dev/null
+++ b/package/libopusenc/libopusenc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libopusenc
+#
+################################################################################
+
+LIBOPUSENC_VERSION = 0.1.1
+LIBOPUSENC_SITE = https://downloads.xiph.org/releases/opus
+LIBOPUSENC_LICENSE = BSD-3-Clause
+LIBOPUSENC_LICENSE_FILES = COPYING
+LIBOPUSENC_INSTALL_STAGING = YES
+LIBOPUSENC_DEPENDENCIES = host-pkgconf opus
+
+LIBOPUSENC_CONF_OPTS = --disable-examples
+
+$(eval $(autotools-package))
-- 
2.17.0
