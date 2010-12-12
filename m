From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] at: ensure startup script is
	well installed
Message-ID: <20101212234311.6E97D8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8c9476d72c45a607ccec49cea175ce736fb52527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case /etc/init.d does not exist.

[Peter: use install -D]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    2 +-
 package/at/at.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index e4d1204..ac5b8cf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: busybox, dbus, cloop, cups,
+	Updated/fixed packages: at, busybox, dbus, cloop, cups,
 	gdk-pixbuf, hostapd, i2c-tools, libconfig, m4, openssh,
 	openssl, pango, qt, rsync, sdl_gfx, sdl_sound, udev, usbutils,
 	xz, zlib
diff --git a/package/at/at.mk b/package/at/at.mk
index c38c424..9067fa5 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -20,7 +20,7 @@ AT_CONF_OPT = \
 	SENDMAIL=/usr/sbin/sendmail
 
 define AT_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
+	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
 endef
 
 AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
-- 
1.7.2.2
