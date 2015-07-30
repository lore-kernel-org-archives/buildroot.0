From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:23 +0200
Subject: [Buildroot] [git commit] package/kodi-audioencoder-flac: bump
	version
Message-ID: <20150730132258.0D53F7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9d0808e8cb60b200584ad8990616e3916d69249
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - also remove -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-flac.mk                      |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 2ccc1b7..f83050b 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 84acb14101b9114472cd20f6a0f8fdefbb376113
+KODI_AUDIOENCODER_FLAC_VERSION = a5e2d1262de3b2de567cf0a8207636ebaacb8775
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg
 KODI_AUDIOENCODER_FLAC_CONF_OPTS += \
-	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
 	-DFLAC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
 	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
 
