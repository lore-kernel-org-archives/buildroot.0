From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 01:30:12 +0200
Subject: [Buildroot] [PATCH 2/4] Move download directory 'dl' back to the
	top hierachy of buildroot
Message-ID: <1253662212-11700-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 Config.in |    4 ++--
 Makefile  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 9897a17..cc83a6a 100644
--- a/Config.in
+++ b/Config.in
@@ -69,13 +69,13 @@ config BR2_TAR_OPTIONS
 
 config BR2_DL_DIR
 	string "Download dir"
-	default "$(BASE_DIR)/dl"
+	default "$(TOPDIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
 	  If the Linux shell environment has defined the BUILDROOT_DL_DIR
 	  environment variable, then this overrides this configuration item.
 
-	  The default is $(BASE_DIR)/dl
+	  The default is $(TOPDIR)/dl
 
 config BR2_COPYTO
 	string "Copy result to..."
diff --git a/Makefile b/Makefile
index a8a5858..176992c 100644
--- a/Makefile
+++ b/Makefile
@@ -232,7 +232,7 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
-DL_DIR:=$(BASE_DIR)/dl
+DL_DIR:=$(TOPDIR)/dl
 endif
 
 BUILD_DIR:=$(BASE_DIR)/build
@@ -443,7 +443,7 @@ dirclean: $(TARGETS_DIRCLEAN)
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
 
 distclean:
-ifeq ($(DL_DIR),$(BASE_DIR)/dl)
+ifeq ($(DL_DIR),$(TOPDIR)/dl)
 	rm -rf $(DL_DIR)
 endif
 	rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
-- 
1.6.3.3
