From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:06 +0100
Subject: [Buildroot] [PATCH 08/16] sdl_sound: avoid using non reevaluated
	$(STAGING_DIR)
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-9-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/sdl_sound/sdl_sound.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index bd94a62..6c45fcf 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -28,11 +28,12 @@ ifeq ($(BR2_PACKAGE_SPEEX),y)
 SDL_SOUND_DEPENDENCIES += speex
 endif
 
-SDL_SOUND_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-		--disable-sdltest \
-		--enable-static \
-		--program-prefix=''
+SDL_SOUND_CONF_OPT = \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+	--disable-sdltest \
+	--enable-static \
+	--program-prefix=''
 
 # enable mmx for newer x86's
 ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
-- 
1.7.2.3
