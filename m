From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Jul 2010 19:55:56 +0200
Subject: [Buildroot] [git commit master 1/1] sdl_sound: fix dependencies
Message-ID: <20100703175635.3444882524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fc5cc936d65dc46d2e5e141d15b1a3cc11f22257
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sdl_sound naturally depends on SDL.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    4 ++--
 package/sdl_sound/sdl_sound.mk |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7e95a3b..6120d25 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,8 +19,8 @@
 	ipsec-tools, iptables, libart, libfuse, libgpg-error, libidn,
 	liblockfile, links, lmbench, lrzsz, make, module-init-tools,
 	nbd, ncurses, netperf, ntfsprogs, openssl, php, qt, quagga,
-	sqlite, sdl, sdl_mixer, sdl_ttf, squashfs, tn5250, tremor,
-	usbutils, xkeyboard-config, xserver_xorg-server
+	sqlite, sdl, sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250,
+	tremor, usbutils, xkeyboard-config, xserver_xorg-server
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 1923257..610e968 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -9,6 +9,7 @@ SDL_SOUND_SITE:=http://icculus.org/SDL_sound/downloads/
 SDL_SOUND_LIBTOOL_PATCH:=NO
 SDL_SOUND_INSTALL_STAGING:=YES
 SDL_SOUND_INSTALL_TARGET:=YES
+SDL_SOUND_DEPENDENCIES = sdl
 
 SDL_SOUND_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-- 
1.7.1
