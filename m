From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:57:38 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional giflib
	support
Message-ID: <20150330210702.843138177F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c7373b370ca0edf54ebc3cc3f7cc67055219f55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: Use --enable-gif / --disable-gif, and do not pass
--extra-libs.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 192a42e..70a8842 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -100,6 +100,13 @@ else
 MPLAYER_CONF_OPTS += --disable-live
 endif
 
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+MPLAYER_DEPENDENCIES += giflib
+MPLAYER_CONF_OPTS += --enable-gif
+else
+MPLAYER_CONF_OPTS += --disable-gif
+endif
+
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
