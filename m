From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  6 Jul 2012 00:42:35 +0200
Subject: [Buildroot] [PATCH v4 4/5] sdl_sound: refactor *_CONF_OPT
	assignment with cpu-feature options
In-Reply-To: <1341528156-4197-1-git-send-email-s.martin49@gmail.com>
References: <1341528156-4197-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1341528156-4197-5-git-send-email-s.martin49@gmail.com>
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
1.7.11.1
