From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:39:04 +0200
Subject: [Buildroot] [git commit] fs/squashfs: add zstd support
Message-ID: <20180425213959.ABEB988E1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=124a149b7d139b07ca97c2c080bf7b48b3974e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/squashfs/Config.in   | 3 +++
 fs/squashfs/squashfs.mk | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index ca9ddb2218..dde2097cb7 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -27,5 +27,8 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_LZO
 config BR2_TARGET_ROOTFS_SQUASHFS4_XZ
 	bool "xz"
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
+	bool "zstd"
+
 endchoice
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 51abd5d7d0..34ab048603 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -16,6 +16,8 @@ else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzma
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
 ROOTFS_SQUASHFS_ARGS += -comp xz
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD),y)
+ROOTFS_SQUASHFS_ARGS += -comp zstd
 else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
