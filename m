From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:53:54 +0100
Subject: [Buildroot] [PATCH 02/17] dbus: ensure startup script is well
	installed
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

If /etc/init.d does not exist, we need to be sure that the dbus
startup script is installed at the right place.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/dbus/dbus.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 1820286..496b9e7 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -60,6 +60,7 @@ endif
 define DBUS_INSTALL_TARGET_FIXUP
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
+	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
 endef
 
-- 
1.7.2.3
