From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:39:43 +0200
Subject: [Buildroot] [git commit] package/mplayer: needs host-pkgconf
Message-ID: <20150330210702.7B5B08177F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fb0b019221383b6bdc3820821c755e6d548709a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mplayer's custom configure script can use pkg-config to discover
dependencies.

[Thomas: improve commit log.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index b2530e4..192a42e 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -11,6 +11,8 @@ MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 MPLAYER_CFLAGS = $(TARGET_CFLAGS)
 MPLAYER_LDFLAGS = $(TARGET_LDFLAGS)
 
+MPLAYER_DEPENDENCIES += host-pkgconf
+
 # mplayer needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 MPLAYER_DEPENDENCIES += alsa-lib
