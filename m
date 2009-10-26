From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 16:51:06 +0100
Subject: [Buildroot] [git commit master] lzma: get rid of unused
	target-headers option
Message-ID: <20091026155124.4695B77681@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=81ce2ae61cb3fb301735bde8773521a8e5bd88ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzma/Config.in |    6 ------
 package/lzma/lzma.mk   |    6 ------
 2 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 9ca3c02..8d7036c 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -9,12 +9,6 @@ config BR2_PACKAGE_LZMA_TARGET
 comment "lzma requires a toolchain with C++ support"
         depends on !BR2_GCC_CROSS_CXX
 
-config BR2_PACKAGE_LZMA_TARGET_HEADERS
-	bool "lzma headers in target"
-	depends on BR2_PACKAGE_LZMA_TARGET
-	help
-	  Put headers files in the target.
-
 config BR2_PACKAGE_LZMA_HOST
 	bool "Install lzma for the host/build system"
 	help
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 9349c19..2de4dcb 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -113,8 +113,6 @@ $(TARGET_DIR)/$(LZMA_TARGET_BINARY): $(LZMA_TARGET_DIR)/src/lzma/lzma
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	touch -c $@
 
-#lzma-headers: $(TARGET_DIR)/$(LZMA_TARGET_BINARY)
-
 lzma-target: $(TARGET_DIR)/$(LZMA_TARGET_BINARY)
 
 lzma-source: $(DL_DIR)/$(LZMA_SOURCE)
@@ -139,7 +137,3 @@ endif
 ifeq ($(BR2_PACKAGE_LZMA_TARGET),y)
 TARGETS+=lzma-target
 endif
-
-#ifeq ($(BR2_PACKAGE_LZMA_TARGET_HEADERS),y)
-#TARGETS+=lzma-headers
-#endif
-- 
1.6.3.3
