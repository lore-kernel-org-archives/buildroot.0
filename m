From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 27 Jun 2017 12:26:41 +0200
Subject: [Buildroot] [PATCH v4 05/11] core: sanitize RPATH in target tree at
	the end of the target finalization
In-Reply-To: <1498559207-8050-1-git-send-email-wg@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
Message-ID: <1498559207-8050-6-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 3b0e336..bda4a05 100644
--- a/Makefile
+++ b/Makefile
@@ -717,6 +717,8 @@ endif
 
 	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
 	$(TOPDIR)/support/scripts/fix-rpath staging
+	@$(call MESSAGE,"Sanitizing RPATH in target tree")
+	$(TOPDIR)/support/scripts/fix-rpath target
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
-- 
2.7.4
