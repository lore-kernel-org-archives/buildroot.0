From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Oct 2015 10:07:21 +0200
Subject: [Buildroot] [git commit] sdl: fix incorrect SDL_CONF_OPTS assignment
Message-ID: <20151021080735.11D1881EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b884e44e0ef857eef1e95719c2e230b687e79a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option --enable-video-directfb=no was being assigned to
SDL_CONF_OPTS instead of being appended to it when
BR2_PACKAGE_SDL_DIRECTFB was disabled. That would clobber any options
previously added to SDL_CONF_OPTS (namely --enable-video-fbcon=yes|no).

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 05d9a54..78eb4dd 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -34,7 +34,7 @@ SDL_DEPENDENCIES += directfb
 SDL_CONF_OPTS += --enable-video-directfb=yes
 SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 else
-SDL_CONF_OPTS = --enable-video-directfb=no
+SDL_CONF_OPTS += --enable-video-directfb=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
