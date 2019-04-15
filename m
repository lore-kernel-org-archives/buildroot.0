From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:28:55 +0200
Subject: [Buildroot] [git commit] fs: introduce variables with name and type
Message-ID: <20190415214606.A4AB68B8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d83c723707d1ead60fec60e55c0bf73936738d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes the filesystems resemble packages yet a bit more, and will
allow sorting "items" on their type and names, when indexed from the
upper-case names.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
