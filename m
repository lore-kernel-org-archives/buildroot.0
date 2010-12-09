From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:07 +0100
Subject: [Buildroot] [PATCH 09/16] sdl_gfx: avoid using non reevaluated
	$(STAGING_DIR)
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-10-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/sdl_gfx/sdl_gfx.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index bd4e3f1..bbfd99f 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -12,9 +12,10 @@ SDL_GFX_INSTALL_TARGET:=YES
 
 SDL_GFX_DEPENDENCIES:=sdl
 
-SDL_GFX_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
-		--disable-sdltest \
-		--enable-static
+SDL_GFX_CONF_OPT = \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--disable-sdltest \
+	--enable-static
 
 # enable mmx for newer x86's
 ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
-- 
1.7.2.3
