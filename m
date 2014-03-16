From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Mar 2014 21:49:41 +0100
Subject: [Buildroot] [git commit] sdl_mixer: drop custom target install
Message-ID: <20140316205026.5A1799BF67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57d284fc2e9c6bbc22b9676f4af8bb3ead2e4460
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/6ba/6ba399db1715a7759048e0d532768a335c3c97cc/

The default rule (make install) works fine, even for static build - so use
that instead of explicitly copying *so files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_mixer/sdl_mixer.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index b7a242f..51b1476 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -34,8 +34,4 @@ else
 SDL_MIXER_CONF_OPT += --disable-music-ogg
 endif
 
-define SDL_MIXER_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
-endef
-
 $(eval $(autotools-package))
