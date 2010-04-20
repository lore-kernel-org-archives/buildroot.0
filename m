From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Apr 2010 16:54:50 +0200
Subject: [Buildroot] [git commit master] initramfs: fix init symlink
Message-ID: <20100420145504.2255920BA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ddb427ef96ac5e1786a9ea00e38ebc65cb2d166
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When initramfs was ported to the new fs structure the init symlink
macro was defined, but forgot to add it to PRE_GEN_HOOKS

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/initramfs/initramfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 9aaf1b0..3e81567 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -17,6 +17,8 @@ define ROOTFS_INITRAMFS_INIT_SYMLINK
 	ln -s sbin/init $(TARGET_DIR)/init
 endef
 
+ROOTFS_INITRAMFS_PRE_GEN_HOOKS += ROOTFS_INITRAMFS_INIT_SYMLINK
+
 define ROOTFS_INITRAMFS_CMD
 	$(SHELL) fs/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
 endef
-- 
1.6.3.3
