From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:18:24 +0200
Subject: [Buildroot] [git commit] fs/iso9660: enable Joliet extension
Message-ID: <20150614212541.E4C467FFFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=818fe5e596a027781eed154d2556d669634a0182
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already enable the Rockridge extension by default when building
ISO9660, so let's also enable the Joliet extension which allows to
support Unicode file names and long file names.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/iso9660.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 35b0fe5..b2f00fd 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -46,7 +46,7 @@ endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
 
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito \
+	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		-o $@ $(ISO9660_TARGET_DIR)
 endef
