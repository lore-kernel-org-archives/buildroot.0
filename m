From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Sep 2018 22:21:37 +0200
Subject: [Buildroot] [PATCH 1/1] blktrace: bump to version 1.2.0
Message-ID: <20180909202137.19888-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-iowatcher-link-with-lrt.patch        | 31 -------------------
 package/blktrace/blktrace.hash                |  6 +++-
 package/blktrace/blktrace.mk                  |  2 +-
 3 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 package/blktrace/0001-iowatcher-link-with-lrt.patch

diff --git a/package/blktrace/0001-iowatcher-link-with-lrt.patch b/package/blktrace/0001-iowatcher-link-with-lrt.patch
deleted file mode 100644
index 689a67814a..0000000000
--- a/package/blktrace/0001-iowatcher-link-with-lrt.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 80d87b99d72034441ea4fbab81f5c80c1ef3b067 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 23 Aug 2016 16:36:14 +0200
-Subject: [PATCH] iowatcher: link with -lrt
-
-Some C libraries (notably uClibc) have the posix_spawn*() functions in
-librt, so let's link iowatcher with -lrt.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream-status: merged
- (http://git.kernel.org/cgit/linux/kernel/git/axboe/blktrace.git/commit/?id=d1ab783430f5a832e973ed9a293da146c04c6702)
----
- iowatcher/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iowatcher/Makefile b/iowatcher/Makefile
-index 7b5101c..502476d 100644
---- a/iowatcher/Makefile
-+++ b/iowatcher/Makefile
-@@ -19,7 +19,7 @@ all: $(ALL)
- 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
- 
- iowatcher: blkparse.o plot.o main.o tracers.o mpstat.o fio.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm -lrt
- 
- depend:
- 	@$(CC) -MM $(ALL_CFLAGS) *.c 1> .depend
--- 
-2.7.4
-
diff --git a/package/blktrace/blktrace.hash b/package/blktrace/blktrace.hash
index acd42fb199..d4f6218486 100644
--- a/package/blktrace/blktrace.hash
+++ b/package/blktrace/blktrace.hash
@@ -1,2 +1,6 @@
 # From http://brick.kernel.dk/snaps/MD5SUMS
-md5	9a6ca62330c8adb0b6a4ea6cf8a55694	blktrace-1.1.0.tar.gz
+md5	05abb873b4de96c5e7b2deba80695bf1	blktrace-1.2.0.tar.gz
+
+# Locally computed
+sha256	d14029bc096026dacb206bf115c912dcdb795320b5aba6dff3e46d7f94c5242d	blktrace-1.2.0.tar.gz
+sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	COPYING
diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index bc29c250b8..6d1c8e3b92 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLKTRACE_VERSION = 1.1.0
+BLKTRACE_VERSION = 1.2.0
 BLKTRACE_SITE = http://brick.kernel.dk/snaps
 BLKTRACE_DEPENDENCIES = libaio
 BLKTRACE_LICENSE = GPL-2.0+
-- 
2.17.1
