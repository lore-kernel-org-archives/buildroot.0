From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 Mar 2018 22:15:32 +0100
Subject: [Buildroot] [PATCH 08/15 v3] fs: split per-rootfs dependency line
In-Reply-To: <cover.1520543724.git.yann.morin.1998@free.fr>
References: <cover.1520543724.git.yann.morin.1998@free.fr>
Message-ID: <6045a5c586ca46eca05d09b0b9fa319d2c77dd30.1520543724.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Note: in its own patch for easier review of a later, bigger patch.
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index db4f8c23ad..cd132cdbc7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -76,7 +76,8 @@ endif
 
 $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 $$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
-$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
+$$(BINARIES_DIR)/rootfs.$(1): target-finalize
+$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	rm -rf $(FS_DIR) $$(ROOTFS_$(2)_DIR)
 	mkdir -p $(FS_DIR) $$(ROOTFS_$(2)_DIR)
-- 
2.14.1
