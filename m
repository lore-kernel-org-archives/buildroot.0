From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  7 Apr 2018 20:19:51 +0200
Subject: [Buildroot] [PATCH v1 3/3] fs/squashfs: add zstd support
In-Reply-To: <20180407181951.22037-1-ps.report@gmx.net>
References: <20180407181951.22037-1-ps.report@gmx.net>
Message-ID: <20180407181951.22037-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.16.3
