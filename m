From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 26 Feb 2017 20:30:47 +0100
Subject: [Buildroot] [PATCH] classpath: add patch to fix or1k compile error
Message-ID: <20170226193047.GA29453@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/a0bb5535fd197b9dd1607a5f0bca477c9575c99f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/classpath/0003-add-or1k-endian.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/classpath/0003-add-or1k-endian.patch

diff --git a/package/classpath/0003-add-or1k-endian.patch b/package/classpath/0003-add-or1k-endian.patch
new file mode 100644
index 0000000..8bc8784
--- /dev/null
+++ b/package/classpath/0003-add-or1k-endian.patch
@@ -0,0 +1,18 @@
+Set endianess for or1k
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur classpath-0.98.orig/native/fdlibm/ieeefp.h classpath-0.98/native/fdlibm/ieeefp.h
+--- classpath-0.98.orig/native/fdlibm/ieeefp.h	2008-01-13 18:33:50.000000000 +0100
++++ classpath-0.98/native/fdlibm/ieeefp.h	2017-02-26 12:39:12.316327363 +0100
+@@ -123,6 +123,10 @@
+ #define __IEEE_BIG_ENDIAN
+ #endif
+ 
++#ifdef __or1k__
++#define __IEEE_BIG_ENDIAN
++#endif
++
+ #ifdef __v800
+ #define __IEEE_LITTLE_ENDIAN
+ #endif
-- 
2.1.4
