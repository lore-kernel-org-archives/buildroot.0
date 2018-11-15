From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Thu, 15 Nov 2018 18:25:41 +0300
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: Fix show-build-order
Message-ID: <20181115152541.27596-1-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The command "make show-build-order" doesn't show dependencies of rootfs-common target.

This patch adds $(ROOTFS_COMMON_DEPENDENCIES) to PACKAGES variable.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 358801d44f..e4a6a4897b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -148,7 +148,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES) $$(ROOTFS_COMMON_DEPENDENCIES))
 endif
 
 # Check for legacy POST_TARGETS rules
-- 
2.17.1
