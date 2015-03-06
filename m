From: Mike Williams <mike@mikebwilliams.com>
Date: Fri,  6 Mar 2015 09:32:17 -0500
Subject: [Buildroot] [PATCH] valgrind: rename ptrcheck to sgcheck like
	upstream
Message-ID: <1425652337-25911-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/valgrind/Config.in   | 6 +++---
 package/valgrind/valgrind.mk | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 558d5f0..d9116dd 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -53,10 +53,10 @@ config BR2_PACKAGE_VALGRIND_DHAT
 	help
 	  This option allows to install the DHAT tool
 
-config BR2_PACKAGE_VALGRIND_PTRCHECK
-	bool "Ptrcheck: an experimental head, stack and global array overrun detector"
+config BR2_PACKAGE_VALGRIND_SGCHECK
+	bool "SGCheck: an experimental stack and global array overrun detector"
 	help
-	  This option allows to install the Ptrcheck tool
+	  This option allows to install the SGCheck tool
 
 config BR2_PACKAGE_VALGRIND_BBV
 	bool "BBV: an experimental basic block vector generation tool"
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index aaca39f..cfce8da 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -91,12 +91,12 @@ endef
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_DHAT
 endif
 
-ifeq ($(BR2_PACKAGE_VALGRIND_PTRCHECK),)
-define VALGRIND_REMOVE_PTRCHECK
-	rm -f $(TARGET_DIR)/usr/lib/valgrind/*ptrcheck*
+ifeq ($(BR2_PACKAGE_VALGRIND_SGCHECK),)
+define VALGRIND_REMOVE_SGCHECK
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/*sgcheck*
 endef
 
-VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_PTRCHECK
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_SGCHECK
 endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND_BBV),)
-- 
2.1.0
