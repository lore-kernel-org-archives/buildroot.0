From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 16:44:06 +0200
Subject: [Buildroot] [git commit master] sdl_net: rename back to SDL_net
Message-ID: <20090901145035.4E772776F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f38fe3a1a3e4448c2a594615eebf869ca2b13d24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that renaming SDL_net to sdl_net (688c388ce765984af2) isn't
such a good idea, as the name is also used for the tarball filename to
download.

Instead go back to use SDL_net again, and simply add an sdl_net alias.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/prboom/prboom.mk |    2 +-
 package/sdl_net/sdl_net.mk     |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 65f48cb..02d018f 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -5,7 +5,7 @@
 #############################################################
 PRBOOM_VERSION:=2.4.7
 
-PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
+PRBOOM_DEPENDENCIES = sdl SDL_net sdl_mixer
 
 $(eval $(call AUTOTARGETS,package/games,prboom))
 
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index 7b7e12a..f01a04c 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -14,4 +14,6 @@ SDL_NET_INSTALL_STAGING = YES
 
 SDL_NET_DEPENDENCIES = sdl
 
-$(eval $(call AUTOTARGETS,package,sdl_net))
+$(eval $(call AUTOTARGETS,package,SDL_net))
+
+sdl_net: SDL_net
-- 
1.6.3.3
