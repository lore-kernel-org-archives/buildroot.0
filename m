From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] cups: avoid using non
	reevaluated $(STAGING_DIR)
Message-ID: <20101212234310.862B18E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e9d7b877c2d0d8dc34e062fca31e069820f1a232
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    6 +++---
 package/cups/cups.mk |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index c958307..5885ae9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,9 +3,9 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: busybox, dbus, cloop, gdk-pixbuf,
-	hostapd, i2c-tools, libconfig, m4, openssh, openssl, qt,
-	sdl_gfx, sdl_sound, udev, usbutils, xz, zlib
+	Updated/fixed packages: busybox, dbus, cloop, cups,
+	gdk-pixbuf, hostapd, i2c-tools, libconfig, m4, openssh,
+	openssl, qt, sdl_gfx, sdl_sound, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 776fb57..169cdb3 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -8,7 +8,7 @@ CUPS_NAME = cups-$(CUPS_VERSION)
 CUPS_DIR = $(BUILD_DIR)/$(CUPS_NAME)
 CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
 CUPS_SOURCE:=$(CUPS_NAME)-source.tar.bz2
-CUPS_DESTDIR:=$(STAGING_DIR)/usr/lib
+CUPS_DESTDIR = $(STAGING_DIR)/usr/lib
 CUPS_CAT:=$(BZCAT)
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-- 
1.7.2.2
