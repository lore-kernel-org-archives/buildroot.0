From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Jul 2011 23:26:36 +0200
Subject: [Buildroot] [git commit] iso9660: fix build after linux package
	change
Message-ID: <20110727212717.385BB88F48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3612ecf4a86f10a7d4601504d21b2872c0ed1c29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux26 target is no more.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/iso9660/iso9660.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index a31b557..afebafc 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
 ISO9660_OPTS+=-U
 endif
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 rootfs-ext2 grub
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-ext2 grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
-- 
1.7.3.4
