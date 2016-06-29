From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:29 +0200
Subject: [Buildroot] [PATCH 22/24] sdl: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-23-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/sdl/sdl.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 38b4b977525f..c2e791dbbd38 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -18,10 +18,8 @@ define SDL_RUN_AUTOGEN
 endef
 
 SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
-HOST_SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
-HOST_SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPTS += --enable-video-fbcon=yes
@@ -87,15 +85,6 @@ SDL_CONF_OPTS += \
 	--disable-nasm \
 	--disable-video-ps3
 
-HOST_SDL_CONF_OPTS += \
-	--enable-pulseaudio=no \
-	--enable-video-x11=no \
-	--disable-arts \
-	--disable-esd \
-	--disable-nasm \
-	--disable-video-ps3
-
 SDL_CONFIG_SCRIPTS = sdl-config
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
