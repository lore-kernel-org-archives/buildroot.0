From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 15:50:53 +0100
Subject: [Buildroot] [git commit branch/next] fs: don't remove intermediate
 files
Message-ID: <20171201162321.DB9508151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=787a31fed42f98a8e2e6a0bd2079376c861436f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that they are in their own directory and no longer pollute the build
dir, there is no point in removing them.

Furthermore, a follow-up patch will require that those files survive
when more than one filesystem image is generated.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 7bbc143..c17c458 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -103,7 +103,6 @@ endif
 	rm -f $$(TARGET_DIR_WARNING_FILE)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
-	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
