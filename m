From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:23 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-audioencoder-vorbis: bump version
Message-ID: <20150808105650.873717F9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3d5e46d759ba83f4ddcf7f13cd87c2931401374
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - also remove -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-vorbis.mk                    |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 493fcbf..a7e99d1 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = d556a6872e59806526f208e8d0af5f886a6c67bb
+KODI_AUDIOENCODER_VORBIS_VERSION = 15d619dae4411ecebadf2ec2996d611600ad0bee
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis
 KODI_AUDIOENCODER_VORBIS_CONF_OPTS += \
-	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
 	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
 	-DVORBIS_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
 	-DVORBISENC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
