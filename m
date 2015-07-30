From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:24 +0200
Subject: [Buildroot] [git commit] kodi-audioencoder-vorbis: use pkg-config
Message-ID: <20150730132258.2980C7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6971ddf0a882f85b330a363d69e668406e179cb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of passing multiple CMake variable, simply depend on
pkg-config: it is used by the FindVorbis and FindOgg modules in
priority over the hand-defined variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-vorbis.mk                    |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index a7e99d1..e895ae3 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -8,10 +8,6 @@ KODI_AUDIOENCODER_VORBIS_VERSION = 15d619dae4411ecebadf2ec2996d611600ad0bee
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
-KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis
-KODI_AUDIOENCODER_VORBIS_CONF_OPTS += \
-	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
-	-DVORBIS_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
-	-DVORBISENC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
 
 $(eval $(cmake-package))
