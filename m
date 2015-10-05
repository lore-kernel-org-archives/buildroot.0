From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 5 Oct 2015 19:52:59 +0100
Subject: [Buildroot] [PATCH] fs/romfs: remove redunant ROMFS_TARGET
	definition
Message-ID: <1444071179-18779-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Probably a leftover from our last fs infra reworking a couple of years
ago.

Incidentally, also added a newline at the end of the file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/romfs/romfs.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index e0ac65f..2738b6b 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-ROMFS_TARGET = $(IMAGE).romfs
-
 ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
 
 define ROOTFS_ROMFS_CMD
 	$(HOST_DIR)/usr/bin/genromfs -d $(TARGET_DIR) -f $@
 endef
 
-$(eval $(call ROOTFS_TARGET,romfs))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,romfs))
-- 
2.5.3
