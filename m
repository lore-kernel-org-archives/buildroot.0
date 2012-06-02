From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:09:45 +0200
Subject: [Buildroot] [PATCH v2 3/5] sdl_gfx: refactor *_CONF_OPT assignment
	with cpu-feature options
In-Reply-To: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
References: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1338674987-2053-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index a25987d..06c37de 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -11,13 +11,7 @@ SDL_GFX_DEPENDENCIES:=sdl
 SDL_GFX_CONF_OPT = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-sdltest \
-	--enable-static
-
-# enable mmx for newer x86's
-ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
-SDL_GFX_CONF_OPT += --enable-mmx
-else
-SDL_GFX_CONF_OPT += --disable-mmx
-endif
+	--enable-static \
+	$(if $(BR2_CPU_HAS_MMX),--enable-mmx,--disable-mmx)
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.10.3
