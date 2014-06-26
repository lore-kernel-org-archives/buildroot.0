From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 26 Jun 2014 12:29:11 +0200
Subject: [Buildroot] [PATCH] Add target-clean makefile target
Message-ID: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makefile target wipes the target folder and forces buildroot into rebuild it.
It's useful when you have changed the list of packages and the target
tree remains out of sync keeping old installed packages no longer needed.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 14fca2b..83dceb7 100644
--- a/Makefile
+++ b/Makefile
@@ -835,6 +835,11 @@ clean:
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
 
+target-clean:
+	rm -rf $(TARGET_DIR)
+	find $(BUILD_DIR) -name ".stamp_target_installed" -exec rm {} \;
+	rm $(BUILD_DIR)/.root
+
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
 	rm -rf $(DL_DIR)
@@ -848,6 +853,7 @@ help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
 	@echo '  distclean              - delete all non-source files (including .config)'
+	@echo '  target-clean           - delete all target files and forces reinstall'
 	@echo
 	@echo 'Build:'
 	@echo '  all                    - make world'
-- 
2.0.0
