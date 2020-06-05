From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:52:46 +0200
Subject: [Buildroot] [PATCH 2/2] package/dbus: remove /usr/lib/dbus-1.0 if
 empty
In-Reply-To: <20200605225247.13350-1-nolange79@gmail.com>
References: <20200605225247.13350-1-nolange79@gmail.com>
Message-ID: <20200605225247.13350-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/dbus/dbus.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index bb9f17a5e0..7a7762f537 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -80,7 +80,8 @@ endef
 DBUS_PRE_INSTALL_TARGET_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
 
 define DBUS_REMOVE_DEVFILES
-	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
+	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0/include
+	-rmdir $(TARGET_DIR)/usr/lib/dbus-1.0 2>/dev/null
 endef
 
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
-- 
2.26.2
