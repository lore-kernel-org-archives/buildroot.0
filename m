From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] udev: fix udev-volume-id staging
	install
Message-ID: <20091216153103.CD56477738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=035e1b5db9842866700a266223aa9df9d5cde191
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$@ no longer refers to the lib under staging after the package rework.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/udev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index e74adb1..ccefae0 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -54,7 +54,7 @@ endef
 ifeq ($(BR2_PACKAGE_UDEV_VOLUME_ID),y)
 define UDEV_VOLUME_ID_STAGING_INSTALL_CMDS
 	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/usr/include/libvolume_id.h
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $@
+	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
 	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so.0
 	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so
 	$(INSTALL) -m 0755 -D package/udev/libvolume_id.la.tmpl $(STAGING_DIR)/lib/libvolume_id.la
-- 
1.6.3.3
