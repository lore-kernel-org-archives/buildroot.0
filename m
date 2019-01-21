From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 21 Jan 2019 10:07:55 +0800
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
Message-ID: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

xz help indicates only 1 thread is used unless we set threads:
-T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
                    to use as many threads as there are processor cores

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index a560417..6a57121 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,7 +106,7 @@ endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
 ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
-ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
+ROOTFS_$(2)_COMPRESS_CMD = xz -T 0 -9 -C crc32 -c
 endif
 
 $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): ROOTFS=$(2)
-- 
2.7.4
