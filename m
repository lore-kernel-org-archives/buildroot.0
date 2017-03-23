From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 23 Mar 2017 08:54:48 +0100
Subject: [Buildroot] [RFC PATCH v3 05/10] core: sanitize RPATH in target
	tree at the end of the target finalization
In-Reply-To: <1490255693-9134-1-git-send-email-wg@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
Message-ID: <1490255693-9134-6-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 41d100e..aea85c8 100644
--- a/Makefile
+++ b/Makefile
@@ -716,6 +716,9 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	@$(call MESSAGE,"Sanitizing RPATH in target tree")
+	$(TOPDIR)/support/scripts/fix-rpath target
+
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-- 
1.9.1
