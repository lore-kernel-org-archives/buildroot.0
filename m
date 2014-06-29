From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:43:55 +0200
Subject: [Buildroot] [git commit] Makefile: do not add to targets common
	dependencies
Message-ID: <20140629145327.DF7409D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61bbbf3a892c951ef14722f2a0d9210ba5be9194
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the rule that adds common dependencies to every target in the
"TARGETS" variable, because all those targets are packages that use the
package infrastructure or they depend on targets that use the package
infrastructure. The package infrastructure already adds common
dependencies.  Therefore, this rule is useless.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9203012..8912791 100644
--- a/Makefile
+++ b/Makefile
@@ -421,10 +421,6 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-# Add base dependencies to all targets even on those not based on the
-# package framework.
-$(TARGETS): dirs prepare dependencies
-
 world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
