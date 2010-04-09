From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] busybox initramfs: do not use the
	IMAGE variable
Message-ID: <20100409142131.B3B6120E6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f840a2b28cf37c63f529fece9e58bed457e684c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/initramfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/initramfs.mk b/package/busybox/initramfs.mk
index afb80f9..394f483 100644
--- a/package/busybox/initramfs.mk
+++ b/package/busybox/initramfs.mk
@@ -7,7 +7,7 @@ ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
 
 BUSYBOX_INITRAMFS_DIR:=$(BUSYBOX_DIR)-initramfs
 BR2_INITRAMFS_DIR:=$(BUILD_DIR)/initramfs
-BB_INITRAMFS_TARGET:=$(IMAGE).initramfs_lst
+BB_INITRAMFS_TARGET:=rootfs.initramfs_lst
 
 $(BUSYBOX_INITRAMFS_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	rm -rf $(BUILD_DIR)/tmp $(BUSYBOX_INITRAMFS_DIR)
-- 
1.6.3.3
