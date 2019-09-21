From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:06 +0200
Subject: [Buildroot] [PATCH v6 05/25] package/kodi-audiodecoder-opus: remove
 package
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is incompatible with Kodi 18.x, configure is broken:

CMake Error at output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/share/kodi/cmake/AddonHelpers.cmake:197 (message):
  "@ADDON_DEPENDS@" not found in addon.xml.in.

This package is also not part of the upstream binary repo:
https://github.com/xbmc/repo-binary-addons

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                    |  6 ++++++
 package/kodi-audiodecoder-opus/Config.in            | 10 ----------
 .../kodi-audiodecoder-opus.hash                     |  2 --
 .../kodi-audiodecoder-opus.mk                       | 13 -------------
 package/kodi/Config.in                              |  1 -
 5 files changed, 6 insertions(+), 26 deletions(-)
 delete mode 100644 package/kodi-audiodecoder-opus/Config.in
 delete mode 100644 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
 delete mode 100644 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b9ee443667..b453f544c6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_KODI_AUDIODECODER_OPUS
+	bool "kodi-audiodecoder-opus package was removed"
+	select BR2_LEGACY
+	help
+	  This package is incompatible with Kodi 18.x.
+
 config BR2_PACKAGE_MESA3D_OSMESA
 	bool "mesa OSMesa option renamed"
 	select BR2_PACKAGE_MESA3D_OSMESA_CLASSIC if BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
diff --git a/package/kodi-audiodecoder-opus/Config.in b/package/kodi-audiodecoder-opus/Config.in
deleted file mode 100644
index 12d7247d58..0000000000
--- a/package/kodi-audiodecoder-opus/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_KODI_AUDIODECODER_OPUS
-	bool "kodi-audiodecoder-opus"
-	select BR2_PACKAGE_KODI_PLATFORM
-	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_OPUS
-	select BR2_PACKAGE_OPUSFILE
-	help
-	  Opus audio decoder for Kodi
-
-	  https://github.com/notspiff/audiodecoder.opus
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
deleted file mode 100644
index 117e9f8337..0000000000
--- a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 bb7037f903f0396da739005843264acd7227cf96eeeac78b0e36d82872c9acc4  kodi-audiodecoder-opus-d6eb25f0c08033f9a2b4d7402e8baf866ebc731c.tar.gz
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
deleted file mode 100644
index d93c33ac51..0000000000
--- a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# kodi-audiodecoder-opus
-#
-################################################################################
-
-KODI_AUDIODECODER_OPUS_VERSION = d6eb25f0c08033f9a2b4d7402e8baf866ebc731c
-KODI_AUDIODECODER_OPUS_SITE = $(call github,notspiff,audiodecoder.opus,$(KODI_AUDIODECODER_OPUS_VERSION))
-KODI_AUDIODECODER_OPUS_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_OPUS_LICENSE_FILES = src/OpusCodec.cpp
-KODI_AUDIODECODER_OPUS_DEPENDENCIES = kodi-platform libogg opus opusfile
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5d781dde8d..32dda14c1f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -289,7 +289,6 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-modplug/Config.in"
 	source "package/kodi-audiodecoder-nosefart/Config.in"
-	source "package/kodi-audiodecoder-opus/Config.in"
 	source "package/kodi-audiodecoder-sidplay/Config.in"
 	source "package/kodi-audiodecoder-snesapu/Config.in"
 	source "package/kodi-audiodecoder-stsound/Config.in"
-- 
2.20.1
