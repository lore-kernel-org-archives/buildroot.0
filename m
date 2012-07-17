From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 09:54:57 +0200
Subject: [Buildroot] [git commit] sdl_gfx: refactor *_CONF_OPT assignment
	with cpu-feature options
Message-ID: <20120717091322.38F9596A73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c044a2d3830d20d26efcd53407a76a050a04d93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_gfx/sdl_gfx.mk |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index 5503bbd..343c7a1 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -11,13 +11,7 @@ SDL_GFX_DEPENDENCIES = sdl
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
+	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx)
 
 $(eval $(call AUTOTARGETS))
