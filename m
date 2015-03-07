From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 14:48:12 +0100
Subject: [Buildroot] [git commit] valgrind: rename ptrcheck to sgcheck like
	upstream
Message-ID: <20150307134826.2B8F0803C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd0e5f6b8818b4301e70dcd24ac790639e3e2470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy             |    9 +++++++++
 package/valgrind/Config.in   |    6 +++---
 package/valgrind/valgrind.mk |    8 ++++----
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0b87ddb..1f57671 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,7 +99,16 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2015.05"
 
+config BR2_PACKAGE_VALGRIND_PTRCHECK
+	bool "valgrind's PTRCheck was renamed to SGCheck"
+	select BR2_LEGACY
+	select BR2_PACKAGE_VALGRIND_SGCHECK
+	help
+	  PTRCheck was renamed to SGCheck in valgrind
+
+###############################################################################
 comment "Legacy options removed in 2015.02"
 
 config BR2_PACKAGE_LIBGC
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
