From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jun 2015 17:05:22 +0200
Subject: [Buildroot] [PATCH 04/12] fs/iso9660: enable Joliet extension
In-Reply-To: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433430330-2166-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already enable the Rockridge extension by default when building
ISO9660, so let's also enable the Joliet extension which allows to
support Unicode file names and long file names.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 5a29673..6a04fe6 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -44,7 +44,7 @@ endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
 
 define ROOTFS_ISO9660_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito \
+	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \
 		-no-emul-boot -boot-load-size 4 -boot-info-table \
 		-o $@ $(ISO9660_TARGET_DIR)
 endef
-- 
2.1.0
