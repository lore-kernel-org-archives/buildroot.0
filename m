From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:09:03 +0100
Subject: [Buildroot] [PATCH 15/19] dbus: fix target installation with
	BR2_HAVE_DEVFILES
In-Reply-To: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1264554547-9009-16-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/dbus/dbus.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 276009c..a97fc02 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -81,7 +81,9 @@ $(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
 	touch $@
 
 $(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
+ifneq ($(BR2_HAVE_DEVFILES),y)
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
+endif
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
 	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
-- 
1.6.6
