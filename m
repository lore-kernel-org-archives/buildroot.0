From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:41:12 +0200
Subject: [Buildroot] [git commit] Makefile: remove 'toolchain' from .PHONY
Message-ID: <20170615100005.34CA08165E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f7b6a688025fb41f326124724ccc1e06ea6fe62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

toolchain is a package, so it is already defined as .PHONY in the
inner-generic-package macro.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 499a39f..5f348b2 100644
--- a/Makefile
+++ b/Makefile
@@ -548,7 +548,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: target-post-image
 
-.PHONY: all world toolchain dirs clean distclean source outputmakefile \
+.PHONY: all world dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
 	list-defconfigs target-finalize target-post-image source-check
 
