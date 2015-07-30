From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:23 +0200
Subject: [Buildroot] [git commit] package/kodi-audioencoder-lame: bump
	version
Message-ID: <20150730132258.147387FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5ce686d3012d8f6603b1b4b49325e283021e19b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - also remove -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-lame.mk                      |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 8a4a28c..cfdf109 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 3eb59de951996659c143faaabacc5f34ee9a0b81
+KODI_AUDIOENCODER_LAME_VERSION = b283cd50cd2f89b7fd7b903c957a6a993e3756d2
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 KODI_AUDIOENCODER_LAME_CONF_OPTS += \
-	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
 	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
 
 $(eval $(cmake-package))
