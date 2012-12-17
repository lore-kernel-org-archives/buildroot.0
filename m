From: Gary Coulbourne <bear@bears.org>
Date: Mon, 17 Dec 2012 17:38:22 -0500
Subject: [Buildroot] [PATCH] dbus version number bump and fix permissions of
	launch helper
Message-ID: <CAEnpE0y2G3GPuXk4aY5cszt2axGfUVbsr9PJdLeLvX7eVOmnhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The stable version of dbus is currently a 1.6.8.  This patch bumps that
version number.  It also fixes a bug in the installation of dbus: the
launch helper was not being installed with the correct permissions nor
users.

---
 package/dbus/dbus.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ec42874..c597dcc 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.24
+DBUS_VERSION = 1.6.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES

@@ -68,6 +68,10 @@ define DBUS_INSTALL_TARGET_FIXUP
        $(INSTALL) -m 0755 -D package/dbus/S30dbus
$(TARGET_DIR)/etc/init.d/S30dbus
 endef

+define DBUS_PERMISSIONS
+/usr/libexec/dbus-daemon-launch-helper f 4750 0 81 - - - - -
+endef
+
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP

 HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
-- 
1.7.10.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121217/9a560b4d/attachment.html>
