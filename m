From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:26 +0200
Subject: [Buildroot] [PATCH 13/16] sdl: Add new dependency libglu for opengl
	support
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdl/sdl.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 086f5e9..fa68198 100644
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
@@ -72,6 +75,7 @@ SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-video-ps3
 
 HOST_SDL_CONF_OPT += --enable-pulseaudio=no \
+		--enable-video-x11=no \
 		--disable-arts \
 		--disable-esd \
 		--disable-nasm \
-- 
1.7.10.4
