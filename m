From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:45 +0200
Subject: [Buildroot] [PATCH 22/30] sdl: Add new dependency libglu for opengl
	support
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <043ce3622b0f78e103bedd5c23741137f5706b4f.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdl/sdl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 8d0e5bd..8adc66b 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -62,7 +62,8 @@ SDL_DEPENDENCIES += alsa-lib
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D),y)
-SDL_DEPENDENCIES += mesa3d
+SDL_DEPENDENCIES += libglu mesa3d
+SDL_CONF_OPT += --enable-video-opengl
 endif
 
 SDL_CONF_OPT += --enable-pulseaudio=no \
-- 
1.8.3.2
