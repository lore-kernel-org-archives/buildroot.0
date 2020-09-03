From: Michael Fischer <mf@go-sys.de>
Date: Thu, 3 Sep 2020 15:30:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: Add patch to fix
 'undefined reference to gp_read_history'
Message-ID: <20200903133014.19824-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/0002-without-history.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/gnuplot/0002-without-history.patch

diff --git a/package/gnuplot/0002-without-history.patch b/package/gnuplot/0002-without-history.patch
new file mode 100644
index 0000000000..2ce144eabd
--- /dev/null
+++ b/package/gnuplot/0002-without-history.patch
@@ -0,0 +1,18 @@
+Patch to solve the 'undefined reference to gp_read_history'
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+
+diff -Naur a/src/history.c b/src/history.c
+--- a/src/history.c	2020-09-03 14:48:47.875493026 +0200
++++ b/src/history.c	2020-09-03 14:50:39.493972218 +0200
+@@ -91,7 +91,9 @@
+ void
+ read_history(char *filename)
+ {
++#ifdef GNUPLOT_HISTORY
+     gp_read_history(filename);
++#endif	
+ }
+ 
+ 
-- 
2.28.0
