From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Aug 2010 23:14:47 +0200
Subject: [Buildroot] [git commit master 1/1] fs/squashfs: fix image file
	permissions
Message-ID: <20100831211658.328888A2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3975e30b991d42d4cc153b738742f962d8fda757
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set image file permissions to 0644 like it was before the fs rework,
instead of the rather unhelpful 0700 (E.G. when image is used for tftp).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/squashfs/squashfs.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 6117de6..aae22b6 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -19,7 +19,8 @@ endif
 
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $$@ -noappend \
-		$(ROOTFS_SQUASHFS_ARGS)
+		$(ROOTFS_SQUASHFS_ARGS) && \
+	chmod 0644 $$@
 endef
 
 $(eval $(call ROOTFS_TARGET,squashfs))
-- 
1.7.1
