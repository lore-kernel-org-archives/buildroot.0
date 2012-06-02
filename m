From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:09:46 +0200
Subject: [Buildroot] [PATCH v2 4/5] sdl_sound: refactor *_CONF_OPT
	assignment with cpu-feature options
In-Reply-To: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
References: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1338674987-2053-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index f95d6bc..05648bf 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -32,8 +32,7 @@ SDL_SOUND_CONF_OPT = \
 	--disable-sdltest \
 	--enable-static
 
-# enable mmx for newer x86's
-ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+ifeq ($(BR2_CPU_HAS_MMX),y)
 SDL_SOUND_CONF_OPT += --enable-mmx
 else
 SDL_SOUND_CONF_OPT += --disable-mmx
-- 
1.7.10.3
