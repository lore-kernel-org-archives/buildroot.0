From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:21 +0200
Subject: [Buildroot] [PATCH v12 21/32] sdl: Add new dependency libglu for
	opengl support
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdl/sdl.mk |    3 ++-
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
1.7.10.4
