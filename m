From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed,  5 Jul 2017 18:53:09 +0200
Subject: [Buildroot] [PATCH v7 4/9] core: sanitize RPATH in target tree at
	the end of target finalization
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <1499273594-12106-5-git-send-email-wg@grandegger.com>
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
index cdc3a64..1a826fc 100644
--- a/Makefile
+++ b/Makefile
@@ -725,6 +725,8 @@ endif
 
 	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
 	$(TOPDIR)/support/scripts/fix-rpath staging
+	@$(call MESSAGE,"Sanitizing RPATH in target tree")
+	$(TOPDIR)/support/scripts/fix-rpath target
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
-- 
2.7.4
