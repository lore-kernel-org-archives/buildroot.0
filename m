From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Jul 2011 23:11:57 +0200
Subject: [Buildroot] [git commit] sdl: build alsa support if enabled
Message-ID: <20110719211531.85EA58B346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8a6f23a42409a0784ffa38c262b50516516e56ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure alsa-lib gets built before SDL if enabled, so the SDL configure
script correctly detects alsa support.

Noticed by Ayla on IRC.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 99488a6..af462c4 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -40,6 +40,10 @@ ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL_DEPENDENCIES += tslib
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+SDL_DEPENDENCIES += alsa-lib
+endif
+
 SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
-- 
1.7.3.4
