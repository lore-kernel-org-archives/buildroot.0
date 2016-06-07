From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:21:11 +0200
Subject: [Buildroot] [git commit] fs/squashfs: split commands
Message-ID: <20160607202530.3D53581F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=892c7fe833fdd8f972d9ea423a456a1e90e60249
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we can properly printf a multi-line command, there is no need
to use a single command to gnerate the squashfs image.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
