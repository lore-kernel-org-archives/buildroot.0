From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Jun 2016 22:43:42 +0200
Subject: [Buildroot] [PATCH 5/7] fs/squashfs: split commands
In-Reply-To: <cover.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <cf321f6916d42e2f6c9dbc0ca396630d477cb202.1465245732.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we can properly printf a multi-line command, there is no need
to use a single command to gnerate the squashfs image.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/squashfs/squashfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index a71d9cc..eadbb8f 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -26,7 +26,7 @@ endif
 
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
-		$(ROOTFS_SQUASHFS_ARGS) && \
+		$(ROOTFS_SQUASHFS_ARGS)
 	chmod 0644 $@
 endef
 
-- 
2.7.4
