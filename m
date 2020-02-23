From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 11:11:50 +0100
Subject: [Buildroot] [git commit] package/libftdi1: fix unresolved symbol
 issue
Message-ID: <20200223100254.2B0D88E7CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=135cc97eefe86066817753bcda94affe32f65470
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC later than 5.x produce _fdti1.so file with an undefined
symbol str2charp_size due to C99 inline semantics change. So
remove this keyword.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[yann.morin.1998 at free.fr: add upstream status]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...5-swig-python-fix-unresolved-symbol-issue.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch b/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
new file mode 100644
index 0000000000..bd13d24d21
--- /dev/null
+++ b/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
@@ -0,0 +1,31 @@
+From e12e592e982fe71b2761da0de7b19e93f67ed22c Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 6 Aug 2019 13:42:06 +0200
+Subject: [PATCH] swig: python: fix unresolved symbol issue
+
+GCC later than 5.x produce _fdti1.so file with an undefined
+symbol str2charp_size due to C99 inline semantics change. So
+remove this keyword.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+[Backport from upstream 3eca5150db07262c1c6eb737e12149201f631d47]
+---
+ python/ftdi1.i | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/ftdi1.i b/python/ftdi1.i
+index 93793f8..0d150cb 100644
+--- a/python/ftdi1.i
++++ b/python/ftdi1.i
+@@ -19,7 +19,7 @@ inline PyObject* charp2str(const char *v_, long len)
+ #endif
+ }
+ 
+-inline char * str2charp_size(PyObject* pyObj, int * size)
++char * str2charp_size(PyObject* pyObj, int * size)
+ {
+   char * v_ = 0;
+ #if PY_MAJOR_VERSION >= 3
+-- 
+2.17.0
+
