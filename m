From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jan 2010 22:20:46 +0100
Subject: [Buildroot] [git commit master] SDL_ttf needs freetype to be built
	and installed first.
Message-ID: <20100125212138.86B9F7772D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e0acedc9e63d94509e542d3359e87d57aecbf0be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    4 ++--
 package/sdl_ttf/sdl_ttf.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a53c568..8c1b7aa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
 	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
 	iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
-	mtd-utils, neon, openvpn, pcre, qt, rpm, sqlite, sshfs, tremor,
-	u-boot, usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
+	mtd-utils, neon, openvpn, pcre, qt, rpm, sdl_ttf, sqlite, sshfs,
+	tremor, u-boot, usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 29e40e8..21bfc5e 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -60,7 +60,7 @@ $(TARGET_DIR)/usr/lib/libSDL_ttf.so: $(STAGING_DIR)/usr/lib/libSDL_ttf.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_ttf*.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_ttf.so
 
-sdl_ttf: sdl $(TARGET_DIR)/usr/lib/libSDL_ttf.so
+sdl_ttf: sdl freetype $(TARGET_DIR)/usr/lib/libSDL_ttf.so
 
 sdl_ttf-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_TTF_DIR) uninstall
-- 
1.6.3.3
