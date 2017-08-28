From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Mon, 28 Aug 2017 11:15:19 +0200
Subject: [Buildroot] [PATCH] libkcapi: fix build with gcc 7.x
Message-ID: <1503911719-25545-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream patch to make libkcapi build with gcc 7.x.

Fixes:

  http://autobuild.buildroot.net/results/01f/01f207ccd1cf5fc030510cb7a4eb2649e124b49b/

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 ...1-Have-sufficient-memory-size-for-message.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch

diff --git a/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch b/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch
new file mode 100644
index 0000000..7526efe
--- /dev/null
+++ b/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch
@@ -0,0 +1,31 @@
+From b56deda7c13c257050fdbdd71c1a5a47b78aa63e Mon Sep 17 00:00:00 2001
+From: Stephan Mueller <smueller@chronox.de>
+Date: Thu, 3 Aug 2017 17:50:51 +0200
+Subject: [PATCH] Have sufficient memory size for message
+
+With GCC 7, the size of the buffer in snprintf is checked. The
+occurrence here is found to be too small.
+
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+
+[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/b56deda7c13c257050fdbdd71c1a5a47b78aa63e]
+---
+ speed-test/cryptoperf-base.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/speed-test/cryptoperf-base.c b/speed-test/cryptoperf-base.c
+index 8766ca7..07384ae 100644
+--- a/speed-test/cryptoperf-base.c
++++ b/speed-test/cryptoperf-base.c
+@@ -172,7 +172,7 @@ char *cp_print_status(struct cp_test *test, int raw)
+ 			(unsigned long)(processed_bytes/totaltime),
+ 			(unsigned long)ops);
+ 	} else {
+-		#define VALLEN 10
++		#define VALLEN 23
+ 		char byteseconds[VALLEN + 1];
+ 
+ 		memset(byteseconds, 0, sizeof(byteseconds));
+-- 
+2.7.4
+
-- 
2.7.4
