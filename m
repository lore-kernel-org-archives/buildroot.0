From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:20:27 +0200
Subject: [Buildroot] [git commit] libkcapi: fix build with gcc 7.x
Message-ID: <20170829211319.2804181F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84bfe9cbbeb36cb084910e65364efcaa2926ca46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch to make libkcapi build with gcc 7.x.

Fixes:

  http://autobuild.buildroot.net/results/01f/01f207ccd1cf5fc030510cb7a4eb2649e124b49b/

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-Have-sufficient-memory-size-for-message.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch b/package/libkcapi/0001-Have-sufficient-memory-size-for-message.patch
new file mode 100644
index 0000000..39e683f
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
+[Upstream commit: https://github.com/smuellerDD/libkcapi/commit/b56deda7c13c257050fdbdd71c1a5a47b78aa63e]
+Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
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
