From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  9 Mar 2015 10:34:13 +0100
Subject: [Buildroot] [PATCH] fs/common: build host-xz when xz compression is
	used
Message-ID: <1425893653-9577-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

When a filesystem image is xz-compressed, the XZ variable is used to refer
to the xz compression tool, but it is not necessarily available. Add a
proper dependency to fix that.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index 1d3926f..5d07f00 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -62,6 +62,7 @@ ROOTFS_$(2)_COMPRESS_EXT = .lzo
 ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
+ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
-- 
1.8.5.1
