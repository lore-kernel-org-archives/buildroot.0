From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:46 +0200
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-vgmstream: new
	package
Message-ID: <20150730132259.287B08007A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05a2cbb1e73be4a1309fad4b215461d930f3991b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-vgmstream/Config.in      |    7 +++++++
 .../kodi-audiodecoder-vgmstream.mk                 |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audiodecoder-vgmstream/Config.in b/package/kodi-audiodecoder-vgmstream/Config.in
new file mode 100644
index 0000000..ebf83df
--- /dev/null
+++ b/package/kodi-audiodecoder-vgmstream/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_VGMSTREAM
+	bool "kodi-audiodecoder-vgmstream"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  VGM decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.vgmstream
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
new file mode 100644
index 0000000..999ad46
--- /dev/null
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-vgmstream
+#
+################################################################################
+
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 7723f9130957f4684eac5788ccbc2f45c39590ad
+KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
+KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPLv2+
+KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
+KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c4ba135..af6aec7 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -256,6 +256,7 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-snesapu/Config.in"
 	source "package/kodi-audiodecoder-stsound/Config.in"
 	source "package/kodi-audiodecoder-timidity/Config.in"
+	source "package/kodi-audiodecoder-vgmstream/Config.in"
 endmenu
 
 menu "Audio encoder addons"
