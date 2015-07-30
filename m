From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:46 +0200
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-stsound: new
	package
Message-ID: <20150730132259.1FE3081EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=742b1c4e3501db47da8251a382b40d70f0a695e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-stsound/Config.in        |    7 +++++++
 .../kodi-audiodecoder-stsound.mk                   |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audiodecoder-stsound/Config.in b/package/kodi-audiodecoder-stsound/Config.in
new file mode 100644
index 0000000..6be216a
--- /dev/null
+++ b/package/kodi-audiodecoder-stsound/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_STSOUND
+	bool "kodi-audiodecoder-stsound"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  YM decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.stsound
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
new file mode 100644
index 0000000..23da01f
--- /dev/null
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-stsound
+#
+################################################################################
+
+KODI_AUDIODECODER_STSOUND_VERSION = f6fbae94818fedd09e2f55c6cd1cb283bfdab6f4
+KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
+KODI_AUDIODECODER_STSOUND_LICENSE = GPLv2+
+KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
+KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9caf873..b3ab9ec 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -254,6 +254,7 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
 	source "package/kodi-audiodecoder-sidplay/Config.in"
 	source "package/kodi-audiodecoder-snesapu/Config.in"
+	source "package/kodi-audiodecoder-stsound/Config.in"
 endmenu
 
 menu "Audio encoder addons"
