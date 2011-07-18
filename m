From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 15:34:26 +0200
Subject: [Buildroot] [git commit] iso9660: fix build after af52661d (linux:
	rename LINUX26 to LINUX)
Message-ID: <20110718133528.1DA448A3A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7876e797d44ce33007bb93e523f0ce019324b6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iso9660 used LINUX26_IMAGE_PATH, which got renamed. Adjust to match
the new name.

Reported-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/iso9660/iso9660.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 2a5288c..a31b557 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -21,7 +21,7 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 rootfs-ext2 gr
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
 	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
-	cp $(LINUX26_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
 	cp $(BINARIES_DIR)/rootfs.ext2 $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
-- 
1.7.3.4
