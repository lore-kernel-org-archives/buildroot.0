From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:32 +0100
Subject: [Buildroot] [PATCH/next 27/31] package/kodi-adsp-freesurround: new
	package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-adsp-freesurround/Config.in                   | 11 +++++++++++
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash |  2 ++
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk   | 13 +++++++++++++
 package/kodi/Config.in                                     |  4 ++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/kodi-adsp-freesurround/Config.in
 create mode 100644 package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
 create mode 100644 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk

diff --git a/package/kodi-adsp-freesurround/Config.in b/package/kodi-adsp-freesurround/Config.in
new file mode 100644
index 0000000..3d6b129
--- /dev/null
+++ b/package/kodi-adsp-freesurround/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_ADSP_FREESURROUND
+	bool "kodi-adsp-freesurround"
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  FreeSurround is meant to be the KODI equivalent of your hi-fi
+	  receiver's Dolby ProLogic II button. It's purpose is to decode
+	  surround information from your stereo music and to produce
+	  multichannel output from it.
+
+	  https://github.com/kodi-adsp/adsp.freesurround
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
new file mode 100644
index 0000000..f23717f
--- /dev/null
+++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 652c32d0c4b61343cbed13b6edd1ab4ad35280240a0ddb386f04adaa46986e7f kodi-adsp-freesurround-08b691d3d9a0382d2f6f789a31614fb02512036c.tar.gz
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
new file mode 100644
index 0000000..49cf673
--- /dev/null
+++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-adsp-freesurround
+#
+################################################################################
+
+KODI_ADSP_FREESURROUND_VERSION = 08b691d3d9a0382d2f6f789a31614fb02512036c
+KODI_ADSP_FREESURROUND_SITE = $(call github,kodi-adsp,adsp.freesurround,$(KODI_ADSP_FREESURROUND_VERSION))
+KODI_ADSP_FREESURROUND_LICENSE = GPLv3+
+KODI_ADSP_FREESURROUND_LICENSE_FILES = LICENSE.md
+KODI_ADSP_FREESURROUND_DEPENDENCIES = libplatform kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8f44581..b035a76 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -236,6 +236,10 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-vgmstream/Config.in"
 endmenu
 
+menu "Audio DSP addons"
+	source "package/kodi-adsp-freesurround/Config.in"
+endmenu
+
 menu "Audio encoder addons"
 	source "package/kodi-audioencoder-flac/Config.in"
 	source "package/kodi-audioencoder-lame/Config.in"
-- 
2.7.0
