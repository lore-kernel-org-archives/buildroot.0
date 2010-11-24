From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 15:32:17 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: remove outdated flush
	target
Message-ID: <20101124143327.6DBFA8DCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=69884e3149f61be476e0dfddcc731096cd1afca2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed any more as we've removed the shared config.cache handling.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index b5498ca..ef130de 100644
--- a/Makefile
+++ b/Makefile
@@ -592,9 +592,6 @@ ifeq ($(O),output)
 endif
 	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
-flush:
-	rm -f $(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache
-
 configured: dirs kernel-headers uclibc-config busybox-config linux26-config
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
@@ -627,7 +624,6 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check all packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
-	@echo '  flush                  - flush configuration cache'
 	@echo
 	@$(foreach b, $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig)), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
-- 
1.7.2.2
