From: Fabio Porcedda <fabio.porcedda@telit.com>
Date: Fri, 27 Jun 2014 14:15:59 +0200
Subject: [Buildroot] [PATCH v3 5/5] Makefile: do not add to targets common
	dependencies
In-Reply-To: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
References: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <1403871359-18849-6-git-send-email-fabio.porcedda@telit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

Remove the rule that adds common dependencies to every target in the
"TARGETS" variable, because all those targets are packages that use the
package infrastructure or they depend on targets that use the package
infrastructure. The package infrastructure already adds common
dependencies.  Therefore, this rule is useless.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v3:
     - improved the description (Arnout)

 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 95ad1f4..4f8f00f 100644
--- a/Makefile
+++ b/Makefile
@@ -420,10 +420,6 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-# Add base dependencies to all targets even on those not based on the
-# package framework.
-$(TARGETS): dirs prepare dependencies
-
 world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
-- 
2.0.0
