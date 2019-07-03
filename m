From: Atharva Lele <itsatharva@gmail.com>
Date: Wed,  3 Jul 2019 22:09:59 +0530
Subject: [Buildroot] [PATCH 2/2] fs/common.mk: do not store original names
 and timestamps when creating GZIP rootfs
In-Reply-To: <20190703163959.23070-1-itsatharva@gmail.com>
References: <20190703163959.23070-1-itsatharva@gmail.com>
Message-ID: <20190703163959.23070-2-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't use the GZIP environment variable to store GZIP options,
so explicitly add -n argument here to increase reproducibility.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
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
