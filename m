From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 22:33:51 +0200
Subject: [Buildroot] [git commit] fs/squashfs: cleanup if-else cascade
Message-ID: <20170711203009.88280818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=815d78f8ba78eda7bd9f119d9ce2739bf0ae7af8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add myself to the DEVELOPPERS for squashfs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS              |  1 +
 fs/squashfs/squashfs.mk | 12 +++---------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ec405a..f392838 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1777,6 +1777,7 @@ N:	Wojciech Nizi??ski <niziak@spox.org>
 F:	package/fwup/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
+F:	fs/squashfs/
 F:	package/cegui06/
 F:	package/celt051/
 F:	package/dtc/
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 68a57b0..342c7a8 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -8,21 +8,15 @@ ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
 ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
-else
-ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
-else
-ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzma
-else
-ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
 ROOTFS_SQUASHFS_ARGS += -comp xz
 else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
-endif
-endif
-endif
 
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
