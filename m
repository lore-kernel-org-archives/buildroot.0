From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Mar 2014 17:55:35 -0300
Subject: [Buildroot] [PATCH 2/2] fs/iso9660: fix iso9660 support
In-Reply-To: <1394139335-28476-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394139335-28476-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394139335-28476-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to the "fs/initramfs: fix initramfs support" commit the same
problem applies to iso9660 in a different way. By adding iso9660 to
TARGETS it gets called before target-finalize with obvious consequences.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/iso9660/iso9660.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index a6a9c95..6c8ace0 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -47,5 +47,5 @@ rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 #
 ################################################################################
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
-TARGETS += rootfs-iso9660
+TARGETS_ROOTFS += rootfs-iso9660
 endif
-- 
1.8.3.2
