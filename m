From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:58:10 +0100
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-opus: new package
Message-ID: <20160305145824.0BE3980F40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eeb1f687d734d2f6cfb1bd14fe54134df26a63a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-opus/Config.in                   | 10 ++++++++++
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash |  2 ++
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk   | 13 +++++++++++++
 package/kodi/Config.in                                     |  1 +
 4 files changed, 26 insertions(+)

diff --git a/package/kodi-audiodecoder-opus/Config.in b/package/kodi-audiodecoder-opus/Config.in
new file mode 100644
index 0000000..12d7247
--- /dev/null
+++ b/package/kodi-audiodecoder-opus/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_OPUS
+	bool "kodi-audiodecoder-opus"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_OPUSFILE
+	help
+	  Opus audio decoder for Kodi
+
+	  https://github.com/notspiff/audiodecoder.opus
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
new file mode 100644
index 0000000..fa60ce5
--- /dev/null
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 74b5736aa21d9cfb8fa835c1dc9cca47817cdb3867f99f5c6aee655f0df476ad kodi-audiodecoder-opus-0bd11e35e6ed8b6480e4100ac8927113cb085eda.tar.gz
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
new file mode 100644
index 0000000..efe17f3
--- /dev/null
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-opus
+#
+################################################################################
+
+KODI_AUDIODECODER_OPUS_VERSION = 0bd11e35e6ed8b6480e4100ac8927113cb085eda
+KODI_AUDIODECODER_OPUS_SITE = $(call github,notspiff,audiodecoder.opus,$(KODI_AUDIODECODER_OPUS_VERSION))
+KODI_AUDIODECODER_OPUS_LICENSE = GPLv2+
+KODI_AUDIODECODER_OPUS_LICENSE_FILES = src/OpusCodec.cpp
+KODI_AUDIODECODER_OPUS_DEPENDENCIES = kodi-platform libogg opus opusfile
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 07f9393..91486b9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -230,6 +230,7 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
+	source "package/kodi-audiodecoder-opus/Config.in"
 	source "package/kodi-audiodecoder-sidplay/Config.in"
 	source "package/kodi-audiodecoder-snesapu/Config.in"
 	source "package/kodi-audiodecoder-stsound/Config.in"
