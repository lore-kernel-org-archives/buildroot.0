From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 23:01:53 +0100
Subject: [Buildroot] [git commit] fs/iso9660: fix iso9660 support
Message-ID: <20140306220200.0816C9936F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ffd8642da498aea902f3c2403f066b99e7b6b23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the "fs/initramfs: fix initramfs support" commit the same
problem applies to iso9660 in a different way. By adding iso9660 to
TARGETS it gets called before target-finalize with obvious consequences.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/iso9660/iso9660.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
