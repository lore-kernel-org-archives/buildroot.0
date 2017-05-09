From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 May 2017 11:08:27 +0100
Subject: [Buildroot] [PATCH next] xfsprogs: bump version to 4.11.0
Message-ID: <20170509100827.36914-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0003 patch already included in this release:
  https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit?id=0a71e38396304b4d1215ba0b51cd6ce8e33eb40d

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...3-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch | 38 ----------------------
 package/xfsprogs/xfsprogs.hash                     |  5 ++-
 package/xfsprogs/xfsprogs.mk                       |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch

diff --git a/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch b/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
deleted file mode 100644
index 36896b5..0000000
--- a/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b981adb6769f6b7d80f6c98627391398a007a25b Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 15 Dec 2015 20:51:35 -0300
-Subject: [PATCH] xfsprogs: don't use CFLAGS with BUILD_CC
-
-When cross-compiling CFLAGS might not be suitable for the host
-(BUILD_CC) compiler since it might contain arch-specific options.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- libxfs/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libxfs/Makefile b/libxfs/Makefile
-index e021625..ad76a04 100644
---- a/libxfs/Makefile
-+++ b/libxfs/Makefile
-@@ -118,7 +118,7 @@ default: ltdepend $(LTLIBRARY)
- 
- crc32table.h: gen_crc32table.c
- 	@echo "    [CC]     gen_crc32table"
--	$(Q) $(BUILD_CC) $(CFLAGS) -o gen_crc32table $<
-+	$(Q) $(BUILD_CC) -o gen_crc32table $<
- 	@echo "    [GENERATE] $@"
- 	$(Q) ./gen_crc32table > crc32table.h
- 
-@@ -129,7 +129,7 @@ crc32table.h: gen_crc32table.c
- # disk.
- crc32selftest: gen_crc32table.c crc32table.h crc32.c
- 	@echo "    [TEST]    CRC32"
--	$(Q) $(BUILD_CC) $(CFLAGS) -D CRC32_SELFTEST=1 crc32.c -o $@
-+	$(Q) $(BUILD_CC) -D CRC32_SELFTEST=1 crc32.c -o $@
- 	$(Q) ./$@
- 
- # set up include/xfs header directory
--- 
-2.7.4
-
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index e990b78..edb2933 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,3 +1,2 @@
-# Locally calculated after checking pgp signature:
-#   https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-4.8.0.tar.sign
-sha256 82ce9cb3a55f4e208e8fe3471ff0aff0602b8300f3e50bdf05cc7e11549686f9  xfsprogs-4.8.0.tar.xz
+# From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
+sha256 c3a6d87b564d7738243c507df82276bed982265e345363a95f2c764e8a5f5bb2  xfsprogs-4.11.0.tar.xz
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index c110733..ed56d34 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.8.0
+XFSPROGS_VERSION = 4.11.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 
-- 
2.10.2
