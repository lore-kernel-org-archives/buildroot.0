From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:38:24 +0100
Subject: [Buildroot] [git commit] usbmount: install configuration file
	unconditionally
Message-ID: <20141201234334.8A7C77FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3d6179bb767c4a6d726cf897d47a076892357db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

[Peter: fix indentation as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbmount/usbmount.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index cc25e4b..9e893c8 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -20,9 +20,7 @@ define USBMOUNT_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
 
 	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
-	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
-	        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
-	fi
+	$(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf
 
 	mkdir -p $(addprefix $(TARGET_DIR)/media/usb,0 1 2 3 4 5 6 7)
 endef
