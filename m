From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 17:57:41 +0200
Subject: [Buildroot] [PATCH v8 13/28] sdl: Add new dependency libglu for
	opengl support
In-Reply-To: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400342276-10303-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdl/sdl.mk |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 8d0e5bd..e8ee0c0 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -62,9 +62,12 @@ SDL_DEPENDENCIES += alsa-lib
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D),y)
-SDL_DEPENDENCIES += mesa3d
+SDL_DEPENDENCIES += libglu mesa3d
+SDL_CONF_OPT += --enable-video-opengl
 endif
 
+SDL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
-- 
1.7.10.4
