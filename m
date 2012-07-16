From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Jul 2012 23:37:29 +0200
Subject: [Buildroot] [PATCH v5 4/5] sdl_sound: refactor *_CONF_OPT
	assignment with cpu-feature options
In-Reply-To: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
References: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342474650-10084-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index a5d9a26..620b3b4 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -32,8 +32,7 @@ SDL_SOUND_CONF_OPT = \
 	--disable-sdltest \
 	--enable-static
 
-# enable mmx for newer x86's
-ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 SDL_SOUND_CONF_OPT += --enable-mmx
 else
 SDL_SOUND_CONF_OPT += --disable-mmx
-- 
1.7.11.2
