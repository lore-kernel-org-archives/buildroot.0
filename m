From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 Oct 2015 17:15:54 -0300
Subject: [Buildroot] [PATCH] mplayer: add license info
Message-ID: <1444248954-12697-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most code is GPLv2+ or compatible except for one file that is
GPLv2-only, hence as a whole is GPLv2 (see Copyright).
Also kill some whitespace and make the only hard dependency
(host-pkgconf) a hard dependency, not an addition, since it's not
conditional.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mplayer/mplayer.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index bab7ed7..d896b35 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -7,12 +7,12 @@
 MPLAYER_VERSION = 1.2
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
 MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
-
+MPLAYER_DEPENDENCIES = host-pkgconf
+MPLAYER_LICENSE = GPLv2
+MPLAYER_LICENSE_FILES = LICENSE Copyright
 MPLAYER_CFLAGS = $(TARGET_CFLAGS)
 MPLAYER_LDFLAGS = $(TARGET_LDFLAGS)
 
-MPLAYER_DEPENDENCIES += host-pkgconf
-
 # mplayer needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 MPLAYER_DEPENDENCIES += alsa-lib
-- 
2.4.9
