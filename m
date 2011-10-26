From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Oct 2011 23:17:42 +0200
Subject: [Buildroot] [git commit] busybox: Fix syntax error when installing
	S10mdev
Message-ID: <20111026211807.5E8398F239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d7c922c5c738f4c9520152d52f83c385a4f1a2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Pepiot <phil@philpep.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c95190d..9ca4c93 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -31,7 +31,7 @@ endif
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
-	[ -f $(TARGET_DIR)/etc/init.d/S10mdev ] ||
+	[ -f $(TARGET_DIR)/etc/init.d/S10mdev ] || \
 		install -D -m 0755 package/busybox/S10mdev \
 			$(TARGET_DIR)/etc/init.d/S10mdev
 endef
