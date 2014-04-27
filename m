From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Apr 2014 21:43:01 +0200
Subject: [Buildroot] [PATCH v6 7/8] sdl: Add new dependency libglu for
	opengl support
In-Reply-To: <1398627782-1939-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398627782-1939-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1398627782-1939-8-git-send-email-bernd.kuhls@t-online.de>
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
