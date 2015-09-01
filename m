From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  1 Sep 2015 13:39:16 +0200
Subject: [Buildroot] [PATCH] package/eudev: fix install command
Message-ID: <1441107556-8212-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The directory $(TARGET_DIR)/etc/init.d/ must exist before installing
S10udev init script.
Add the missing "-D" option to create the "init.d" directory.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/eudev/eudev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index b916acd..1aa74b3 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -57,7 +57,7 @@ EUDEV_CONF_OPTS += --disable-selinux
 endif
 
 define EUDEV_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
 # Required by default rules for input devices
-- 
2.4.3
