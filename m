From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:32:34 +0200
Subject: [Buildroot] [git commit master 1/1] prboom: bump version
Message-ID: <20101014183258.8CC308C006@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc6d5d9b3c3d626f15841829d59b059da960c2ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Special big endian handling is no longer needed and X option is gone.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/prboom/prboom.mk |   14 +++-----------
 1 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 228c788..651118c 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -3,7 +3,8 @@
 # PrBoom
 #
 #############################################################
-PRBOOM_VERSION = 2.4.7
+PRBOOM_VERSION = 2.5.0
+PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
 PRBOOM_DEPENDENCIES = sdl SDL_net sdl_mixer
 
 PRBOOM_CONF_OPT = \
@@ -12,16 +13,7 @@ PRBOOM_CONF_OPT = \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-cpu-opt \
 		--disable-sdltest \
-		--disable-gl \
-		--without-x
-
-define PRBOOM_BIG_ENDIAN_FIXUP
-	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' $(PRBOOM_DIR)/config.h
-endef
-
-ifeq ($(BR2_ENDIAN),"BIG")
-PRBOOM_POST_CONFIGURE_HOOKS += PRBOOM_BIG_ENDIAN_FIXUP
-endif
+		--disable-gl
 
 define PRBOOM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/src/prboom $(TARGET_DIR)/usr/games/prboom
-- 
1.7.1
