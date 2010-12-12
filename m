From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] dbus: ensure startup script is
	well installed
Message-ID: <20101212234309.054498E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=732cb780eeace7306702d3dedb7f54b47ef134ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If /etc/init.d does not exist, we need to be sure that the dbus
startup script is installed at the right place.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    4 ++--
 package/dbus/dbus.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 142b654..e625d59 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,8 +3,8 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: busybox, cloop, gdk-pixbuf, libconfig,
-	m4, openssh, openssl, qt, usbutils, xz, zlib
+	Updated/fixed packages: busybox, dbus, cloop, gdk-pixbuf,
+	libconfig, m4, openssh, openssl, qt, usbutils, xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 1820286..f485ceb 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -60,7 +60,7 @@ endif
 define DBUS_INSTALL_TARGET_FIXUP
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
-	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 -D package/dbus/S30dbus $(TARGET_DIR)/etc/init.d/S30dbus
 endef
 
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP
-- 
1.7.2.2
