From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 16:12:21 +0100
Subject: [Buildroot] [git commit branch/next] sdl: add host version
Message-ID: <20140219151948.224D89CAA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=102f86e8d462b70ec687c7d3438926f778f3ddf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Host version is needed to build xbmc

[Peter: use _PRE_CONFIGURE_HOOKS like target version]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index cf3366d..a983fec 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -18,8 +18,9 @@ define SDL_RUN_AUTOGEN
 endef
 
 SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
-SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
+HOST_SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 
+SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPT += --enable-video-fbcon=yes
@@ -80,3 +81,4 @@ endef
 SDL_POST_INSTALL_STAGING_HOOKS += SDL_FIXUP_SDL_CONFIG
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
