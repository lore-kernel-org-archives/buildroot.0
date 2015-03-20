From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:07 -0400
Subject: [Buildroot] [PATCH v2 16/25] usbmount: move udev rules to /usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-17-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/usbmount/usbmount.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 9e893c8..54fcffe 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -19,7 +19,7 @@ define USBMOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink 	\
 		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
 
-	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
+	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/usr/lib/udev/rules.d/usbmount.rules
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf
 
 	mkdir -p $(addprefix $(TARGET_DIR)/media/usb,0 1 2 3 4 5 6 7)
-- 
2.1.0
