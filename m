From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 May 2017 23:21:45 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/cgroupfs-mount: bump version
	to 1.4
Message-ID: <20170523212145.31602-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed empty line from cgroupfs-mount.mk as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cgroupfs-mount/cgroupfs-mount.hash | 2 +-
 package/cgroupfs-mount/cgroupfs-mount.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/cgroupfs-mount/cgroupfs-mount.hash b/package/cgroupfs-mount/cgroupfs-mount.hash
index 34f516764..926a031d7 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.hash
+++ b/package/cgroupfs-mount/cgroupfs-mount.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	  fb32a8d9de491358d28f56ab76a56e1a611b90d5b6326910d3a69395fa539027	cgroupfs-mount-7285bf44402029394808339f69f4f293730fc2c6.tar.gz
+sha256 d6c8aff7af59c7d0082ee3018c97f73b0421e81a49bb28ad9f66a36da5cd6ec7  cgroupfs-mount-1.4.tar.gz
diff --git a/package/cgroupfs-mount/cgroupfs-mount.mk b/package/cgroupfs-mount/cgroupfs-mount.mk
index 096c728e3..9a7679995 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.mk
+++ b/package/cgroupfs-mount/cgroupfs-mount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CGROUPFS_MOUNT_VERSION = 7285bf44402029394808339f69f4f293730fc2c6
+CGROUPFS_MOUNT_VERSION = 1.4
 CGROUPFS_MOUNT_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_MOUNT_VERSION))
 CGROUPFS_MOUNT_LICENSE = GPL-3.0+
 CGROUPFS_MOUNT_LICENSE_FILES = debian/copyright
@@ -17,7 +17,6 @@ endef
 define CGROUPFS_MOUNT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(CGROUPFS_MOUNT_PKGDIR)/S30cgroupfs \
 		$(TARGET_DIR)/etc/init.d/S30cgroupfs
-
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
