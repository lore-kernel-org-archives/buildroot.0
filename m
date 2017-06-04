From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 00:09:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdbm: fix build error
Message-ID: <20170604220950.22746-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4eb/4ebb8c47a71043470ce3fc626ac10f02902c2a43/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
I am unsure whether this is the right fix so I am sending this patch for
review first before I will contact upstream, Bernd.

 package/gdbm/0001-gdbmopen.c-fix-build.patch | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/gdbm/0001-gdbmopen.c-fix-build.patch

diff --git a/package/gdbm/0001-gdbmopen.c-fix-build.patch b/package/gdbm/0001-gdbmopen.c-fix-build.patch
new file mode 100644
index 000000000..7dd2fd2af
--- /dev/null
+++ b/package/gdbm/0001-gdbmopen.c-fix-build.patch
@@ -0,0 +1,30 @@
+From 7b20e17f72ff8043696c9b024065e474f3ebca9b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 5 Jun 2017 00:03:57 +0200
+Subject: [PATCH 1/1] gdbmopen.c: fix build
+
+This patch fixes build errors detected by Buildroot autobuilders on
+various platforms using uClibc:
+http://autobuild.buildroot.net/?reason=gdbm-1.13
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/gdbmopen.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gdbmopen.c b/src/gdbmopen.c
+index 80474a6..a9bfb32 100644
+--- a/src/gdbmopen.c
++++ b/src/gdbmopen.c
+@@ -32,7 +32,7 @@
+ #endif
+ 
+ static void
+-compute_directory_size (GDBM_FILE dbf, blksize_t block_size,
++compute_directory_size (GDBM_FILE dbf, __blksize_t block_size,
+ 			int *ret_dir_size, int *ret_dir_bits)
+ {
+   /* Create the initial hash table directory.  */
+-- 
+2.11.0
+
-- 
2.11.0
