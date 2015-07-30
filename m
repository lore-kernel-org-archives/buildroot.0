From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:24 +0200
Subject: [Buildroot] [git commit branch/next] kodi-audioencoder-flac: use
	pkg-config
Message-ID: <20150808105650.9E8727FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cf39cac66d984372a693ea8cfe2bdee80561776
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of passing multiple CMake variable, simply depend on
pkg-config: it is used by the FindFLAC and FindOgg modules in priority
over the hand-defined variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-flac.mk                      |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index f83050b..f386954 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -8,9 +8,6 @@ KODI_AUDIOENCODER_FLAC_VERSION = a5e2d1262de3b2de567cf0a8207636ebaacb8775
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
-KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg
-KODI_AUDIOENCODER_FLAC_CONF_OPTS += \
-	-DFLAC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
-	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
 
 $(eval $(cmake-package))
