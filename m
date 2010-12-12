From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] rsync: avoid using non
	reevaluated $(TARGET_DIR) in RSYNC_INSTALL_TARGET_OPT
Message-ID: <20101212234310.C0E2B8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8c874a334edb4d14b73a3964e90b20e78729fc93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    3 ++-
 package/rsync/rsync.mk |   18 +++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5885ae9..a31fb5d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,8 @@
 
 	Updated/fixed packages: busybox, dbus, cloop, cups,
 	gdk-pixbuf, hostapd, i2c-tools, libconfig, m4, openssh,
-	openssl, qt, sdl_gfx, sdl_sound, udev, usbutils, xz, zlib
+	openssl, qt, rsync, sdl_gfx, sdl_sound, udev, usbutils, xz,
+	zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e1bb28e..5ffbfbb 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,19 +4,19 @@
 #
 #############################################################
 
-RSYNC_VERSION:=3.0.7
-RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
-RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
-RSYNC_INSTALL_STAGING:=NO
-RSYNC_INSTALL_TARGET:=YES
-RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
+RSYNC_VERSION := 3.0.7
+RSYNC_SOURCE := rsync-$(RSYNC_VERSION).tar.gz
+RSYNC_SITE := http://rsync.samba.org/ftp/rsync/src
+RSYNC_INSTALL_STAGING = NO
+RSYNC_INSTALL_TARGET = YES
+RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 ifeq ($(BR2_ENABLE_DEBUG),y)
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
+RSYNC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  install
 else
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
+RSYNC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
 			  STRIPPROG="$(TARGET_STRIP)" install-strip
 endif
-RSYNC_CONF_OPT:=--with-included-popt
+RSYNC_CONF_OPT = --with-included-popt
 
 $(eval $(call AUTOTARGETS,package,rsync))
-- 
1.7.2.2
