From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 12 Aug 2016 22:39:58 +0200
Subject: [Buildroot] [PATCH v2] poco: fix m68k compile
Message-ID: <20160812203957.GA2064@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch from double-conversion upstream project which is bundled
with poco to fix compile for m68k.

Fixes:
  http://autobuild.buildroot.net/results/791917c1343f53e12f27b06cfd5e1d2e88078014/
  http://autobuild.buildroot.net/results/349d4b49d65a652551c4de20233684bb4ffa5ae3/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - add better comment and commit id, suggested by Baruch

---
 package/poco/0002-fix-m68k-double-conv-detect.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/poco/0002-fix-m68k-double-conv-detect.patch

diff --git a/package/poco/0002-fix-m68k-double-conv-detect.patch b/package/poco/0002-fix-m68k-double-conv-detect.patch
new file mode 100644
index 0000000..3ca03fc
--- /dev/null
+++ b/package/poco/0002-fix-m68k-double-conv-detect.patch
@@ -0,0 +1,19 @@
+Fixes compile for m68k.
+
+From upstream double-conversion commit da111796231:
+https://github.com/google/double-conversion/blob/master/double-conversion/utils.h
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur poco-poco-1.7.2-release.orig/Foundation/src/utils.h poco-poco-1.7.2-release/Foundation/src/utils.h
+--- poco-poco-1.7.2-release.orig/Foundation/src/utils.h	2016-03-19 08:19:35.000000000 +0100
++++ poco-poco-1.7.2-release/Foundation/src/utils.h	2016-08-11 02:55:02.827238119 +0200
+@@ -63,6 +63,8 @@
+     defined(__AARCH64EL__) || \
+     defined(nios2) || defined(__nios2) || defined(__nios2__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
++#elif defined(__mc68000__)
++#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+ // Windows uses a 64bit wide floating point stack.
-- 
2.1.4
