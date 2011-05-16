From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 22:54:37 +0200
Subject: [Buildroot] [git commit] sdl: fix directfb driver build if host has
	directfb-config
Message-ID: <20110516210340.CFEAF8352F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=668c357fec27d6b02c9201de5764bb8d1bdd67c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure our cross directfb-config is used, so the right linker paths
as passed to the compiler.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 8d9d8ae..99488a6 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -6,8 +6,8 @@
 SDL_VERSION:=1.2.14
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
 SDL_SITE:=http://www.libsdl.org/release
-
 SDL_INSTALL_STAGING = YES
+SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPT+=--enable-video-fbcon=yes
-- 
1.7.3.4
