From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 21:08:33 +0200
Subject: [Buildroot] [git commit] Makefile: Ensure BASE_TARGET_DIR exists,
 not TARGET_DIR
Message-ID: <20180331190850.F369481251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d02062787041877b56c51b20cbc13af24264aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was present in Yann's original patch, but got dropped when I rebased
commit 7e9870ce32 (core: introduce intermediate BASE_TARGET_DIR variable) to
fix the Makefile conflicts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6a3d038e66..71c77f474d 100644
--- a/Makefile
+++ b/Makefile
@@ -945,7 +945,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 
 # staging and target directories do NOT list these as
 # dependencies anywhere else
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 # outputmakefile generates a Makefile in the output directory, if using a
