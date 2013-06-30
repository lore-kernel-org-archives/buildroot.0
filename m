From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:29:06 +0200
Subject: [Buildroot] [PATCH 16/23] Remove TOOLCHAIN_DIR
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The $(O)/toolchain directory, also called $(TOOLCHAIN_DIR) is no
longer needed, as all packages are now built in $(O)/build/, including
gcc and uClibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 189a1db..e3e2750 100644
--- a/Makefile
+++ b/Makefile
@@ -264,7 +264,6 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
-TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/system/skeleton
 
 LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
@@ -387,7 +386,7 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
-dirs: $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
@@ -405,7 +404,7 @@ world: toolchain $(TARGETS_ALL)
 	legal-info legal-info-prepare legal-info-clean \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
-	$(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 ################################################################################
@@ -414,7 +413,7 @@ world: toolchain $(TARGETS_ALL)
 # dependencies anywhere else
 #
 ################################################################################
-$(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
+$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -732,7 +731,7 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
+		$(STAMP_DIR) $(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
 
 distclean: clean
-- 
1.8.1.2
