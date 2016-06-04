From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 4 Jun 2016 13:42:33 +0200
Subject: [Buildroot] [PATCH v2] zeromq: fix sparc32 compile
Message-ID: <20160604114232.GA11109@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Code is otherwise compiled with sparcv9 optimization and
cannot be run on sparc32 (sparcv8) machine.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
v1 -> v2:
  - add git formatted patch requested by Thomas Petazzoni
---
 .../zeromq/0003-allow-to-build-sparc-v8-leon.patch |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/zeromq/0003-allow-to-build-sparc-v8-leon.patch

diff --git a/package/zeromq/0003-allow-to-build-sparc-v8-leon.patch b/package/zeromq/0003-allow-to-build-sparc-v8-leon.patch
new file mode 100644
index 0000000..126a03b
--- /dev/null
+++ b/package/zeromq/0003-allow-to-build-sparc-v8-leon.patch
@@ -0,0 +1,30 @@
+From d0b22397ebbef8e250c4cad25b8686018804aa15 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Sat, 4 Jun 2016 09:30:49 +0200
+Subject: [PATCH] allow to build sparc (v8,leon)
+
+Only set sparcv9 optimization for sparc64 systems.
+This allows to run for example application using zeromq
+on sparc32 systems.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index af8293c..cabd734 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -291,7 +291,7 @@ fi
+ 
+ # CPU-specific optimizations
+ case "${host_cpu}" in
+-    *sparc*)
++    *sparc64*)
+         AC_LANG_PUSH([C++])
+         LIBZMQ_CHECK_LANG_FLAG_PREPEND([-mcpu=v9])
+         AC_LANG_POP([C++])
+-- 
+2.7.4 (Apple Git-66)
+
-- 
1.7.10.4
