From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:50:14 +0200
Subject: [Buildroot] [git commit] fs/common.mk: move down
 ROOTFS_REPRODUCIBLE for consistency
Message-ID: <20200904123951.8EB49801F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0f3d22976f214b25556be05b7e70e69968281f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is cosmetic and moves down ROOTFS_REPRODUCIBLE for
consistency.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 1b44dc42ba..ec6aa831d1 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -36,12 +36,6 @@ ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 ROOTFS_FULL_DEVICES_TABLE = $(FS_DIR)/full_devices_table.txt
 ROOTFS_FULL_USERS_TABLE = $(FS_DIR)/full_users_table.txt
 
-ifeq ($(BR2_REPRODUCIBLE),y)
-define ROOTFS_REPRODUCIBLE
-	find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)
-endef
-endif
-
 ROOTFS_COMMON_NAME = rootfs-common
 ROOTFS_COMMON_TYPE = rootfs
 ROOTFS_COMMON_DEPENDENCIES = \
@@ -49,6 +43,12 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define ROOTFS_REPRODUCIBLE
+	find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_REFPOLICY),y)
 define ROOTFS_SELINUX
 	$(HOST_DIR)/sbin/setfiles -m -r $(TARGET_DIR) \
