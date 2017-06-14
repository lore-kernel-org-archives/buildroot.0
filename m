From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Jun 2017 00:11:28 +0200
Subject: [Buildroot] [PATCH 1/8] Makefile: remove 'toolchain' from .PHONY
In-Reply-To: <20170614221135.17470-1-arnout@mind.be>
References: <20170614221135.17470-1-arnout@mind.be>
Message-ID: <20170614221135.17470-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

toolchain is a package, so it is already defined as .PHONY in the
inner-generic-package macro.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 499a39fe20..5f348b2513 100644
--- a/Makefile
+++ b/Makefile
@@ -548,7 +548,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: target-post-image
 
-.PHONY: all world toolchain dirs clean distclean source outputmakefile \
+.PHONY: all world dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
 	list-defconfigs target-finalize target-post-image source-check
 
-- 
2.11.0
