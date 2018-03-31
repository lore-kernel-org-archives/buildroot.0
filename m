From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:05 +0200
Subject: [Buildroot] [git commit] fs: split per-rootfs dependency line
Message-ID: <20180331185352.1232584BBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a6c55de4993065cc8170c0bb13ef17ef39b9078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index b208c6f479..ab42beb7be 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -75,7 +75,8 @@ endif
 
 $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 $$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
-$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
+$$(BINARIES_DIR)/rootfs.$(1): target-finalize
+$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	rm -rf $(FS_DIR) $$(ROOTFS_$(2)_DIR)
 	mkdir -p $(FS_DIR) $$(ROOTFS_$(2)_DIR)
