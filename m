From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-nosefart: new
	package
Message-ID: <20150730132259.000BD7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6383a78e4a3c33945ccb9ab2f0586ba1330b4cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-nosefart/Config.in       |    7 +++++++
 .../kodi-audiodecoder-nosefart.mk                  |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audiodecoder-nosefart/Config.in b/package/kodi-audiodecoder-nosefart/Config.in
new file mode 100644
index 0000000..96591aa
--- /dev/null
+++ b/package/kodi-audiodecoder-nosefart/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_NOSEFART
+	bool "kodi-audiodecoder-nosefart"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Nosefart decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.nosefart
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
new file mode 100644
index 0000000..40786d7
--- /dev/null
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-nosefart
+#
+################################################################################
+
+KODI_AUDIODECODER_NOSEFART_VERSION = 936313f2be5c4936af8a643876363dcea76a8ebe
+KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
+KODI_AUDIODECODER_NOSEFART_LICENSE = GPLv2+
+KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
+KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 68882a9..a686d60 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -251,6 +251,7 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
+	source "package/kodi-audiodecoder-nosefart/Config.in"
 endmenu
 
 menu "Audio encoder addons"
