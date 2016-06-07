From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:21:29 +0200
Subject: [Buildroot] [git commit] fs/squashfs: remove useless chmod
Message-ID: <20160607202530.5FF1C81F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1a2c0ed3c73ea37b506eae0edbbabdb366c2d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When that was added (in 975e30b, fs/squashfs: fix image file
permissions), the reasons were not quite explicit.

We are now forcing the umask, and various tests have shown that the mode
on the generated image file are correct without the chmod.

Remove it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/squashfs/squashfs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index eadbb8f..c4d9ca5 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -27,7 +27,6 @@ endif
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
 		$(ROOTFS_SQUASHFS_ARGS)
-	chmod 0644 $@
 endef
 
 $(eval $(call ROOTFS_TARGET,squashfs))
