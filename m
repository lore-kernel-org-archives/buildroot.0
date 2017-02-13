From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 13 Feb 2017 22:30:45 +0100
Subject: [Buildroot] [PATCH] openswan: fix autobuild failures with uClibc-ng
Message-ID: <20170213213045.GA13499@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix following autobuild failures:

Fixes:
  http://autobuild.buildroot.net/results/31cf680c48bec8ba4450a6fe2156cb441c4dd660
  http://autobuild.buildroot.net/results/95220f231810cb12ba97a6b44af79f84af706c82

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-uClibc-ng-is-compatible-to-glibc.patch    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch

diff --git a/package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch b/package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch
new file mode 100644
index 0000000..aa4d0ed
--- /dev/null
+++ b/package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch
@@ -0,0 +1,39 @@
+From 0f7bf4706d2932aaa50904fc529a853c9f86478f Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 13 Feb 2017 22:18:11 +0100
+Subject: [PATCH] uClibc-ng is compatible to glibc
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+Pull-Request: https://github.com/xelerance/Openswan/pull/227
+
+---
+ linux/include/openswan.h | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/linux/include/openswan.h b/linux/include/openswan.h
+index e2c45a130..66b9d42b2 100644
+--- a/linux/include/openswan.h
++++ b/linux/include/openswan.h
+@@ -27,18 +27,6 @@
+ #endif
+ 
+ /*
+- * When using uclibc, malloc(0) returns NULL instead of success. This is
+- * to make it use the inbuilt work-around.
+- * See: http://osdir.com/ml/network.freeswan.devel/2003-11/msg00009.html
+- */
+-#ifdef __UCLIBC__
+-# if !defined(__MALLOC_GLIBC_COMPAT__) && !defined(MALLOC_GLIBC_COMPAT)
+-#  warning Please compile uclibc with GLIBC_COMPATIBILITY defined
+-# endif
+-#endif
+-
+-
+-/*
+  * We've just got to have some datatypes defined...  And annoyingly, just
+  * where we get them depends on whether we're in userland or not.
+  */
+-- 
+2.11.1
+
-- 
2.1.4
