From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 17:59:05 -0300
Subject: [Buildroot] [PATCH] eudev: add input group
Message-ID: <1413838745-14008-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's used by 50-default-udev.rules for input-class devices.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/eudev/eudev.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index fd935a7..d29f762 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -42,4 +42,9 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
+# Required by default rules for input devices
+define EUDEV_USERS
+	'' -1 input -1 * - - - input group
+endef
+
 $(eval $(autotools-package))
-- 
2.0.4
