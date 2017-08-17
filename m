From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Aug 2017 06:12:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: fix build error with gcc7
Message-ID: <20170817041230.14468-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4a1/4a1931565674442c6117b2b202a002dd0ec12a4b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
For the next branch we should bump the package to 2.0.0 which includes
this fix and switches the build system to cmake.

 package/librsync/0001-fix-build-with-clang.patch | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/librsync/0001-fix-build-with-clang.patch

diff --git a/package/librsync/0001-fix-build-with-clang.patch b/package/librsync/0001-fix-build-with-clang.patch
new file mode 100644
index 000000000..ea513c04d
--- /dev/null
+++ b/package/librsync/0001-fix-build-with-clang.patch
@@ -0,0 +1,37 @@
+From 1175b1cd102ee15512185c7983868e5746959da0 Mon Sep 17 00:00:00 2001
+From: Adam Schubert <feartohell@seznam.cz>
+Date: Mon, 11 May 2015 04:25:45 +0200
+Subject: [PATCH] Fix build under clang
+
+Downloaded from upstream commit:
+https://github.com/librsync/librsync/commit/1175b1cd102ee15512185c7983868e5746959da0.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+---
+ delta.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/delta.c b/delta.c
+index 19498f9..72afdf6 100644
+--- a/delta.c
++++ b/delta.c
+@@ -126,12 +126,12 @@ static rs_result rs_delta_s_scan(rs_job_t *job);
+ static rs_result rs_delta_s_flush(rs_job_t *job);
+ static rs_result rs_delta_s_end(rs_job_t *job);
+ void rs_getinput(rs_job_t *job);
+-inline int rs_findmatch(rs_job_t *job, rs_long_t *match_pos, size_t *match_len);
+-inline rs_result rs_appendmatch(rs_job_t *job, rs_long_t match_pos, size_t match_len);
+-inline rs_result rs_appendmiss(rs_job_t *job, size_t miss_len);
+-inline rs_result rs_appendflush(rs_job_t *job);
+-inline rs_result rs_processmatch(rs_job_t *job);
+-inline rs_result rs_processmiss(rs_job_t *job);
++static inline int rs_findmatch(rs_job_t *job, rs_long_t *match_pos, size_t *match_len);
++static inline rs_result rs_appendmatch(rs_job_t *job, rs_long_t match_pos, size_t match_len);
++static inline rs_result rs_appendmiss(rs_job_t *job, size_t miss_len);
++static inline rs_result rs_appendflush(rs_job_t *job);
++static inline rs_result rs_processmatch(rs_job_t *job);
++static inline rs_result rs_processmiss(rs_job_t *job);
+ 
+ /**
+  * \brief Get a block of data if possible, and see if it matches.
-- 
2.11.0
