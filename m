From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 21:47:28 +0200
Subject: [Buildroot] [PATCH 06/12 v3] fs: introduce variables with name and
 type
In-Reply-To: <cover.1555357644.git.yann.morin.1998@free.fr>
References: <cover.1555357644.git.yann.morin.1998@free.fr>
Message-ID: <cbcbb18a1d108d782367c6b8371fffb26b8319a2.1555357644.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makes the filesystems resemble packages yet a bit more, and will
allow sorting "items" on their type and names, when indexed from the
upper-case names.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 fs/common.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 4ad51fdd0a..286d671d06 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -42,6 +42,8 @@ define ROOTFS_REPRODUCIBLE
 endef
 endif
 
+ROOTFS_COMMON_NAME = rootfs-common
+ROOTFS_COMMON_TYPE = rootfs
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
 	$(BR2_TAR_HOST_DEPENDENCY) \
@@ -77,6 +79,8 @@ rootfs-common-show-depends:
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
 
+ROOTFS_$(2)_NAME = rootfs-$(1)
+ROOTFS_$(2)_TYPE = rootfs
 ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
 ROOTFS_$(2)_FINAL_IMAGE_NAME = $$(strip $$(ROOTFS_$(2)_IMAGE_NAME))
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
-- 
2.14.1
