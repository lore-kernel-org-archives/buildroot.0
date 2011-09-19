From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:05 +0200
Subject: [Buildroot] [PATCH 02/21] sdl_net: normalize package to sdl_net
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d3e1c8c331b7a52c22018569beacd3c180e30d7d.1316464690.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
