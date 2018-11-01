From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu,  1 Nov 2018 15:02:31 +0100
Subject: [Buildroot] [PATCH 3/3] fs: Add common rootfs dependencies to
 PACKAGES
In-Reply-To: <20181101140231.24380-1-anaumann@ultratronik.de>
References: <20181101140231.24380-1-anaumann@ultratronik.de>
Message-ID: <20181101140231.24380-4-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed so host-fakeroot etc. are included when assembling the global
host directory from the per-package folders so that the common rootfs commands
can continue to use these tools from the global host dir.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 fs/common.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 453da6010a..bffb8a1ac1 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -64,6 +64,8 @@ ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
+PACKAGES += $(ROOTFS_COMMON_DEPENDENCIES)
+
 
 $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
 $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
-- 
2.19.1
