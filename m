From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:28 +0100
Subject: [Buildroot] [PATCHv2 70/74] usbmount: install configuration file
	unconditionally
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-71-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usbmount/usbmount.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index cc25e4b..76c027f 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -20,9 +20,7 @@ define USBMOUNT_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
 
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
-	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
-	        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
-	fi
+        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf
 
 	mkdir -p $(addprefix $(TARGET_DIR)/media/usb,0 1 2 3 4 5 6 7)
 endef
-- 
2.1.0
