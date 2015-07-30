From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-audiodecoder-sidplay: new package
Message-ID: <20150808105651.5FC9781904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98c1792273b8219fb20b96982e78ee39939e97e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-sidplay/Config.in        |    8 ++++++++
 .../kodi-audiodecoder-sidplay.mk                   |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audiodecoder-sidplay/Config.in b/package/kodi-audiodecoder-sidplay/Config.in
new file mode 100644
index 0000000..ae99afa
--- /dev/null
+++ b/package/kodi-audiodecoder-sidplay/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY
+	bool "kodi-audiodecoder-sidplay"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBSIDPLAY2
+	help
+	  Sidplay decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.sidplay
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
new file mode 100644
index 0000000..82b5c2b
--- /dev/null
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-sidplay
+#
+################################################################################
+
+KODI_AUDIODECODER_SIDPLAY_VERSION = 27b2c0582878857bfe03195471fa7ffa4bcc40f0
+KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
+KODI_AUDIODECODER_SIDPLAY_LICENSE = GPLv2+
+KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
+KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi-platform libsidplay2
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a686d60..6256d80 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -252,6 +252,7 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
+	source "package/kodi-audiodecoder-sidplay/Config.in"
 endmenu
 
 menu "Audio encoder addons"
