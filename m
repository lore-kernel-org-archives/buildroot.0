From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 16 Jul 2019 23:12:13 +0530
Subject: [Buildroot] [PATCH v2 1/2] fs/common.mk: do not store original
 names and timestamps when creating GZIP rootfs
Message-ID: <20190716174214.11914-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't use the GZIP environment variable to store GZIP options
anymore. So explicitly add -n argument to the GZIP call to ensure
reproducibility.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - Reversed order of patches
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index fceb38c5b9..ca46a331d6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -115,7 +115,7 @@ ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES = $$(sort \
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
-ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c -n
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 ROOTFS_$(2)_COMPRESS_EXT = .bz2
-- 
2.22.0
