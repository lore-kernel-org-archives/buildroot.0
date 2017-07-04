From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue,  4 Jul 2017 18:22:33 +0200
Subject: [Buildroot] [PATCH v6 04/10] core: sanitize RPATH in staging tree
	at the end of target finalization
In-Reply-To: <1499185359-8293-1-git-send-email-wg@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
Message-ID: <1499185359-8293-5-git-send-email-wg@grandegger.com>
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
index b37171f..1d07673 100644
--- a/Makefile
+++ b/Makefile
@@ -715,6 +715,9 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
+	$(TOPDIR)/support/scripts/fix-rpath staging
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
-- 
2.7.4
