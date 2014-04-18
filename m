From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 18 Apr 2014 15:07:31 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: toolchain-eclipse-register: add
	toolchain dependency
Message-ID: <1397826452-30281-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "toolchain-eclipse-register" target needs the toolchain so add
toolchain as a dependency.
This also fix the support to top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 42adf7c..53282ae 100644
--- a/Makefile
+++ b/Makefile
@@ -621,7 +621,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-toolchain-eclipse-register:
+toolchain-eclipse-register: toolchain
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
-- 
1.9.2
