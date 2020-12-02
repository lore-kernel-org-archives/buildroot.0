From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 Dec 2020 07:32:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: security bump to version
 5.4.1
Message-ID: <20201202063243.1103254-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2020-25412: com_line() in command.c in gnuplot 5.4 leads to an
  out-of-bounds-write from strncpy() that may lead to arbitrary code
  execution.
- Drop second patch (already in version)
- Update indentation in hash file (two spaces)

http://gnuplot.info/ReleaseNotes_5_4_1.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuplot/0002-without-history.patch | 17 -----------------
 package/gnuplot/gnuplot.hash               |  8 ++++----
 package/gnuplot/gnuplot.mk                 |  2 +-
 3 files changed, 5 insertions(+), 22 deletions(-)
 delete mode 100644 package/gnuplot/0002-without-history.patch

diff --git a/package/gnuplot/0002-without-history.patch b/package/gnuplot/0002-without-history.patch
deleted file mode 100644
index 6091da8415..0000000000
--- a/package/gnuplot/0002-without-history.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-history.c: Patch to solve the 'undefined reference to gp_read_history'
-
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-
-diff -purN gnuplot-5.4.0.org/src/history.c gnuplot-5.4.0/src/history.c
---- gnuplot-5.4.0.org/src/history.c	2019-12-10 07:22:32.000000000 +0100
-+++ gnuplot-5.4.0/src/history.c	2020-09-14 10:07:36.525441702 +0200
-@@ -91,7 +91,9 @@ write_history(char *filename)
- void
- read_history(char *filename)
- {
--    gp_read_history(filename);
-+#ifdef GNUPLOT_HISTORY
-+    	gp_read_history(filename);
-+#endif	
- }
- 
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 260b78314e..9770185c21 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.0/
-md5 ac586178f3b031dea82cd3890cefb21b  gnuplot-5.4.0.tar.gz
-sha1 b4660dff7d047a453c55fd77faba11f63bb2d5ed  gnuplot-5.4.0.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.1/
+md5  80f75b684f1175d36cd6908ff1ceb588  gnuplot-5.4.1.tar.gz
+sha1  bb1cd34f8ec0357eccef70122f0fd531ced5dd29  gnuplot-5.4.1.tar.gz
 # Locally computed
-sha256  eb4082f03a399fd1e9e2b380cf7a4f785e77023d8dcc7e17570c1b5570a49c47  gnuplot-5.4.0.tar.gz
+sha256  6b690485567eaeb938c26936e5e0681cf70c856d273cc2c45fabf64d8bc6590e  gnuplot-5.4.1.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index ef9ef2ac67..746831275a 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.0
+GNUPLOT_VERSION = 5.4.1
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.29.2
