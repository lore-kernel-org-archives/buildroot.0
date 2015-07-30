From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-audiodecoder-modplug: new package
Message-ID: <20150808105651.4FBC281904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d695a9613f61fb1f3f557f3c28f2f6ba7309d7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-modplug/Config.in        |    8 ++++++++
 .../kodi-audiodecoder-modplug.mk                   |   13 +++++++++++++
 package/kodi/Config.in                             |    4 ++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/Config.in b/package/kodi-audiodecoder-modplug/Config.in
new file mode 100644
index 0000000..0269973
--- /dev/null
+++ b/package/kodi-audiodecoder-modplug/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_MODPLUG
+	bool "kodi-audiodecoder-modplug"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBMODPLUG
+	help
+	  Modplug decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.modplug
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
new file mode 100644
index 0000000..004d89f
--- /dev/null
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-modplug
+#
+################################################################################
+
+KODI_AUDIODECODER_MODPLUG_VERSION = 5ae7349f39a8e5552c86dfdad339fb18c7e52550
+KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
+KODI_AUDIODECODER_MODPLUG_LICENSE = GPLv2+
+KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
+KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi-platform libmodplug
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6b1b9f3..68882a9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -249,6 +249,10 @@ config BR2_PACKAGE_KODI_WAVPACK
 config BR2_PACKAGE_KODI_OPTICALDRIVE
 	bool
 
+menu "Audio decoder addons"
+	source "package/kodi-audiodecoder-modplug/Config.in"
+endmenu
+
 menu "Audio encoder addons"
 	source "package/kodi-audioencoder-flac/Config.in"
 	source "package/kodi-audioencoder-lame/Config.in"
