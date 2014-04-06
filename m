From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sun,  6 Apr 2014 09:48:21 +0200
Subject: [Buildroot] [PATCH 2/2] rootfs-bzip: use host-bzip2 instead of
	local bzip2
In-Reply-To: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
References: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <1396770501-9443-3-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 fs/common.mk           |    3 ++-
 package/bzip2/bzip2.mk |    2 ++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 57bcd2d..8e11b46 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -46,8 +46,9 @@ ROOTFS_$(2)_COMPRESS_EXT = .gz
 ROOTFS_$(2)_COMPRESS_CMD = $$(GZIP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
+ROOTFS_$(2)_DEPENDENCIES += host-bzip2
 ROOTFS_$(2)_COMPRESS_EXT = .bz2
-ROOTFS_$(2)_COMPRESS_CMD = bzip2 -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = $$(BZIP2) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 ROOTFS_$(2)_DEPENDENCIES += host-lzma
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index fcddb55..469f72b 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -65,3 +65,5 @@ endef
 
 $(eval $(generic-package))
 $(eval $(host-generic-package))
+
+BZIP2 = $(HOST_DIR)/usr/bin/bzip2
-- 
1.7.4.4
