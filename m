From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 23:28:51 +0100
Subject: [Buildroot] [git commit] sdl: use default autotools target-install
Message-ID: <20130205223114.4906F9A17A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=042e0b54f91c71594fd09731d1cc3173b65dad1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/c950d7920d384cb0d37403cbe8344691d4231a1a

The normal 'make install' is perfectly fine, and it also works for static
builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 139312f..4786dc5 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -70,8 +70,4 @@ endef
 
 SDL_POST_INSTALL_STAGING_HOOKS+=SDL_FIXUP_SDL_CONFIG
 
-define SDL_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
-endef
-
 $(eval $(autotools-package))
