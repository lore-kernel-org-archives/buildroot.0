From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] sdl_gfx: avoid using non
	reevaluated $(STAGING_DIR)
Message-ID: <20101212234310.46D018E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b8c860992a408e7d650af369b39cc1c5edef5980
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/sdl_gfx/sdl_gfx.mk |    7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index a735b06..c958307 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: busybox, dbus, cloop, gdk-pixbuf,
 	hostapd, i2c-tools, libconfig, m4, openssh, openssl, qt,
-	sdl_sound, udev, usbutils, xz, zlib
+	sdl_gfx, sdl_sound, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
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
1.7.2.2
