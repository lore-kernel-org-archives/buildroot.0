From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Apr 2018 21:39:51 +0200
Subject: [Buildroot] [PATCH v3 4/6] fs/squashfs: add zstd support
In-Reply-To: <20180416193953.19924-1-ps.report@gmx.net>
References: <20180416193953.19924-1-ps.report@gmx.net>
Message-ID: <20180416193953.19924-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v2 -> v3:
  - no changes

Changes v1 -> v2:
  - add reviewed-by: Yann E. MORIN
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
