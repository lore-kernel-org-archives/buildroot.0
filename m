From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 3 Jun 2016 05:16:45 +0200
Subject: [Buildroot] [PATCH] zeromq: fix sparc32 compile
Message-ID: <20160603031645.GA28308@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Code is otherwise compiled with sparcv9 optimization and
cannot be run on sparc32 (sparcv8) machine.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/zeromq/0003-fix-sparc-compile.patch |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/zeromq/0003-fix-sparc-compile.patch

diff --git a/package/zeromq/0003-fix-sparc-compile.patch b/package/zeromq/0003-fix-sparc-compile.patch
new file mode 100644
index 0000000..e4f1881
--- /dev/null
+++ b/package/zeromq/0003-fix-sparc-compile.patch
@@ -0,0 +1,18 @@
+Fix sparcv8 compile
+Suggested upstream:
+https://github.com/zeromq/libzmq/issues/2021
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur zeromq-4.1.4.orig/configure.ac zeromq-4.1.4/configure.ac
+--- zeromq-4.1.4.orig/configure.ac	2015-11-04 09:55:13.000000000 +0100
++++ zeromq-4.1.4/configure.ac	2016-06-03 04:41:16.167033535 +0200
+@@ -293,7 +293,7 @@
+ 
+ # CPU-specific optimizations
+ case "${host_cpu}" in
+-    *sparc*)
++    *sparc64*)
+         AC_LANG_PUSH([C++])
+         LIBZMQ_CHECK_LANG_FLAG_PREPEND([-mcpu=v9])
+         AC_LANG_POP([C++])
-- 
1.7.10.4
