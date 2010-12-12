From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] sdl_sound: avoid using non
	reevaluated $(STAGING_DIR)
Message-ID: <20101212234310.1E4E68E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c7247d090569a028a0a2858969a153bf4317dc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/sdl_sound/sdl_sound.mk |   11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index d5c40c5..a735b06 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: busybox, dbus, cloop, gdk-pixbuf,
 	hostapd, i2c-tools, libconfig, m4, openssh, openssl, qt,
-	udev, usbutils, xz, zlib
+	sdl_sound, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
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
1.7.2.2
