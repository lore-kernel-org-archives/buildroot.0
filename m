From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Oct 2015 17:08:45 +0200
Subject: [Buildroot] [git commit] mplayer: add license info
Message-ID: <20151008151451.0132E7FB5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee3e913f1befeb3cb174e2ee2498d1d1a4b8716e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most code is GPLv2+ or compatible except for one file that is
GPLv2-only, hence as a whole is GPLv2 (see Copyright).
Also kill some whitespace and make the only hard dependency
(host-pkgconf) a hard dependency, not an addition, since it's not
conditional.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/mplayer.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
