From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Jun 2012 09:43:01 +0200
Subject: [Buildroot] [git commit] mediastreamer: alsa support needs mixer +
	pcm
Message-ID: <20120608074615.B288996EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bc8d2a21ae99eb41e383f3bf3d8553813066093
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/ec6e32eb44e39c1f622da39a8c5d80eb95433a54

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mediastreamer/mediastreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 65e4ec7..be91c44 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -5,7 +5,7 @@ MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkg-config ortp
 # tests fail linking on some architectures, so disable them
 MEDIASTREAMER_CONF_OPT = --disable-tests
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
 MEDIASTREAMER_CONF_OPT += --enable-alsa
 MEDIASTREAMER_DEPENDENCIES += alsa-lib
 else
