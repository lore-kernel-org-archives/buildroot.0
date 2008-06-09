From: Kieran Bingham <kbingham@mpc-data.co.uk>
Date: Mon, 9 Jun 2008 14:18:34 +0100
Subject: [PATCH] Fix GCC build to prevent stripping LD script file
Message-ID: <mailman.5.1213017879.1342.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 toolchain/gcc/gcc-uclibc-3.x.mk |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index 58afa92..5659621 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -286,7 +286,7 @@ $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu %-ld,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 5365cdf..d4b3170 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -299,7 +299,7 @@ $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu %-ld,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
-- 
1.5.4.3


--------------070301060800020103060800--
