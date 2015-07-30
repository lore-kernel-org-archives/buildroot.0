From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:46 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-audiodecoder-timidity: new package
Message-ID: <20150808105651.76AC481904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb564206748d34cb1b5304cbbee2b27fcf2ff66c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-timidity/Config.in       |    7 +++++++
 .../kodi-audiodecoder-timidity.mk                  |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/kodi-audiodecoder-timidity/Config.in b/package/kodi-audiodecoder-timidity/Config.in
new file mode 100644
index 0000000..8f604ad
--- /dev/null
+++ b/package/kodi-audiodecoder-timidity/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_TIMIDITY
+	bool "kodi-audiodecoder-timidity"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Timidity decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.timidity
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
new file mode 100644
index 0000000..49ff7bc
--- /dev/null
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-audiodecoder-timidity
+#
+################################################################################
+
+KODI_AUDIODECODER_TIMIDITY_VERSION = da5eb9ac6557fc1ea0f48cc044cfd16f4f2a1e0b
+KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
+KODI_AUDIODECODER_TIMIDITY_LICENSE = GPLv2+
+KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
+KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b3ab9ec..c4ba135 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -255,6 +255,7 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-sidplay/Config.in"
 	source "package/kodi-audiodecoder-snesapu/Config.in"
 	source "package/kodi-audiodecoder-stsound/Config.in"
+	source "package/kodi-audiodecoder-timidity/Config.in"
 endmenu
 
 menu "Audio encoder addons"
