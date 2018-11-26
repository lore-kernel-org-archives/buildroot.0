From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 12:49:26 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] fs/common.mk: Fix
 show-build-order
Message-ID: <20181126114618.B10B38866A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371498e002f181253806a9b42a858a70d48d3f3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The command "make show-build-order" doesn't show dependencies of rootfs-common target.

This patch adds $(ROOTFS_COMMON_DEPENDENCIES) to PACKAGES variable.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 305e4487e5c18ed89bf2aa106b2068f9dce686fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 6d579db810..ac8fd4c24a 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -122,7 +122,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES) $$(ROOTFS_COMMON_DEPENDENCIES))
 endif
 
 # Check for legacy POST_TARGETS rules
