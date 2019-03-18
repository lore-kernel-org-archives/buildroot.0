From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 18 Mar 2019 17:30:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/skeleton-init-common: Create
 /lib/modules directory
Message-ID: <20190318163010.8056-1-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For read-only root file systems, the kernel-modules
will be mounted over this directory.
This directory should always exist for this reason,
just as /mnt and /opt are in the skeleton.

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
---
 package/skeleton-init-common/skeleton-init-common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index e429b13d78..b39794eddc 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -20,6 +20,7 @@ define SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_INIT_COMMON_PATH),$(TARGET_DIR))
 	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/modules
 	$(SED) 's, at PATH@,$(BR2_SYSTEM_DEFAULT_PATH),' $(TARGET_DIR)/etc/profile
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
-- 
2.20.1
