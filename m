From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:36:25 +0200
Subject: [Buildroot] [git commit] fs: add all recursive dependencies to
 packages list
Message-ID: <20190415214606.B0D278B8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b35c71745d4e0ed5edd30e0a91f991a9c703569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, only first-level dependencies of a filesystem are added to
the global list of packages, thus missing all recursive dependencies.

Use the newly introduced recursive variable instead, which already
contains the rootfs-common dependencies too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 5ec28ca183..f7989eac57 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -190,7 +190,7 @@ rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES) $$(ROOTFS_COMMON_DEPENDENCIES))
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES))
 endif
 
 # Check for legacy POST_TARGETS rules
