From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Jun 2014 10:26:18 +0200
Subject: [Buildroot] [PATCH v2 3/3] Makefile: do not add to targets common
	dependencies
In-Reply-To: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1403252778-19761-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the rule that add common dependencies to every targets in the
"TARGETS" variable because all those targets are packages that use the package
framework that already add common dependencies.
---
 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9de4806..c028cf8 100644
--- a/Makefile
+++ b/Makefile
@@ -433,10 +433,6 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-# Add base dependencies to all targets even on those not based on the
-# package framework.
-$(TARGETS): dirs prepare dependencies
-
 world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
-- 
2.0.0
