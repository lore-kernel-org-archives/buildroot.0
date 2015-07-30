From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-snesapu: new
	package
Message-ID: <20150730132259.0FAF87FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec9ced31f12fbf02b6d7e37ca52ed7e0b810f49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-snesapu/Config.in        |    7 +++++++
 .../kodi-audiodecoder-snesapu.mk                   |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audiodecoder-snesapu/Config.in b/package/kodi-audiodecoder-snesapu/Config.in
new file mode 100644
index 0000000..0cb572f
--- /dev/null
+++ b/package/kodi-audiodecoder-snesapu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_SNESAPU
+	bool "kodi-audiodecoder-snesapu"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  SPC decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.snesapu
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
new file mode 100644
index 0000000..a696b41
--- /dev/null
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-snesapu
+#
+################################################################################
+
+KODI_AUDIODECODER_SNESAPU_VERSION = 399d1d3f32fe6f62f5657b8ce67c30229629cb51
+KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
+KODI_AUDIODECODER_SNESAPU_LICENSE = GPLv2+
+KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
+KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6256d80..9caf873 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -253,6 +253,7 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
 	source "package/kodi-audiodecoder-sidplay/Config.in"
+	source "package/kodi-audiodecoder-snesapu/Config.in"
 endmenu
 
 menu "Audio encoder addons"
