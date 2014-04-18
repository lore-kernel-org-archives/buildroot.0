From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Apr 2014 21:47:09 +0200
Subject: [Buildroot] [PATCH] package/sdl: disable x11 in host-sdl
Message-ID: <1397850429-5560-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We do not need an X11-capable host SDL, so jsut disable X11 support.

This currently works if the build machine has the X11 development
packages installed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sdl/sdl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index d36f3ff..8d0e5bd 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -72,6 +72,7 @@ SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-video-ps3
 
 HOST_SDL_CONF_OPT += --enable-pulseaudio=no \
+		--enable-video-x11=no \
 		--disable-arts \
 		--disable-esd \
 		--disable-nasm \
-- 
1.8.3.2
