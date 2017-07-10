From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jul 2017 00:14:51 +0200
Subject: [Buildroot] [PATCH 1/3 v2] fs/squashfs: cleanup if-else cascade
In-Reply-To: <cover.1499724881.git.yann.morin.1998@free.fr>
References: <cover.1499724881.git.yann.morin.1998@free.fr>
Message-ID: <3af4ce901c7726b755342c6c72dece9e2842d085.1499724881.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And add myself to the DEVELOPPERS for squashfs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 DEVELOPERS              |  1 +
 fs/squashfs/squashfs.mk | 12 +++---------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ec405a570..f392838efe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1777,6 +1777,7 @@ N:	Wojciech Nizi?ski <niziak@spox.org>
 F:	package/fwup/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
+F:	fs/squashfs/
 F:	package/cegui06/
 F:	package/celt051/
 F:	package/dtc/
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 68a57b074a..342c7a8a37 100644
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
-- 
2.11.0
