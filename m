From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] pango: ensure startup script is
	well installed
Message-ID: <20101212234311.3575F8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a16af6526ffd84275f74377ba3c3051f4b68df17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case /etc/init.d does not exist.

[Peter: use install -D]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 ++--
 package/pango/pango.mk |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a31fb5d..e4d1204 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,8 +5,8 @@
 
 	Updated/fixed packages: busybox, dbus, cloop, cups,
 	gdk-pixbuf, hostapd, i2c-tools, libconfig, m4, openssh,
-	openssl, qt, rsync, sdl_gfx, sdl_sound, udev, usbutils, xz,
-	zlib
+	openssl, pango, qt, rsync, sdl_gfx, sdl_sound, udev, usbutils,
+	xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 373eb8b..0556896 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -55,7 +55,8 @@ else
 endif
 
 define PANGO_INSTALL_INITSCRIPT
-	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -m 755 -D package/pango/S25pango \
+		$(TARGET_DIR)/etc/init.d/S25pango
 endef
 
 PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
-- 
1.7.2.2
