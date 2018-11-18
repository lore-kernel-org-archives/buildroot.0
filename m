From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 09:46:52 +0100
Subject: [Buildroot] [git commit] fs/common.mk: Fix show-build-order
Message-ID: <20181118085835.C6B2A7FE6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=305e4487e5c18ed89bf2aa106b2068f9dce686fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The command "make show-build-order" doesn't show dependencies of rootfs-common target.

This patch adds $(ROOTFS_COMMON_DEPENDENCIES) to PACKAGES variable.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 358801d44f..e4a6a4897b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -148,7 +148,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES) $$(ROOTFS_COMMON_DEPENDENCIES))
 endif
 
 # Check for legacy POST_TARGETS rules
