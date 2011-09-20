From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:43:11 +0200
Subject: [Buildroot] [git commit] sdl_net: normalize package to sdl_net
Message-ID: <20110920205934.D8DAD8D72D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaee60a1f5c949d9abed25d2eb18294a693cabf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/prboom/prboom.mk |    2 +-
 package/sdl_net/sdl_net.mk     |    4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 3a50fd5..dd749dc 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -5,7 +5,7 @@
 #############################################################
 PRBOOM_VERSION = 2.5.0
 PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
-PRBOOM_DEPENDENCIES = sdl SDL_net sdl_mixer
+PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 PRBOOM_DEPENDENCIES += libpng
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index f01a04c..7b7e12a 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -14,6 +14,4 @@ SDL_NET_INSTALL_STAGING = YES
 
 SDL_NET_DEPENDENCIES = sdl
 
-$(eval $(call AUTOTARGETS,package,SDL_net))
-
-sdl_net: SDL_net
+$(eval $(call AUTOTARGETS,package,sdl_net))
