From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Mar 2021 17:21:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: drop tslib
Message-ID: <20210321162128.192269-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

non existing tslib support has been dropped since version 2.0.14 and
https://github.com/libsdl-org/SDL/commit/4c96faee578efcba3f2d6afe8e2122f26b1dfb0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2/sdl2.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 48148d38e3..a2e426e578 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -142,13 +142,6 @@ else
 SDL2_CONF_OPTS += --disable-video-opengles
 endif
 
-ifeq ($(BR2_PACKAGE_TSLIB),y)
-SDL2_DEPENDENCIES += tslib
-SDL2_CONF_OPTS += --enable-input-tslib
-else
-SDL2_CONF_OPTS += --disable-input-tslib
-endif
-
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 SDL2_DEPENDENCIES += alsa-lib
 SDL2_CONF_OPTS += --enable-alsa
-- 
2.30.1
