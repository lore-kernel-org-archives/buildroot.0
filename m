From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 21:53:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/python3: fix initconfig.h include
Message-ID: <20200202205306.1785085-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fix is needed to enable cracklib with python3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n-pystate.h-fix-initconfig.h-include.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/python3/0034-Include-cpython-pystate.h-fix-initconfig.h-include.patch

diff --git a/package/python3/0034-Include-cpython-pystate.h-fix-initconfig.h-include.patch b/package/python3/0034-Include-cpython-pystate.h-fix-initconfig.h-include.patch
new file mode 100644
index 0000000000..aa7835e0a4
--- /dev/null
+++ b/package/python3/0034-Include-cpython-pystate.h-fix-initconfig.h-include.patch
@@ -0,0 +1,30 @@
+From ce8731443896e7513239c2d831733b0d87417e42 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Feb 2020 18:52:56 +0100
+Subject: [PATCH] Include/cpython/pystate.h: fix initconfig.h include
+
+This fix is needed to fix detection of python3.8/Python.h with cracklib
+
+See https://bugs.python.org/issue39026
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Include/cpython/pystate.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Include/cpython/pystate.h b/Include/cpython/pystate.h
+index d1792575c9..0a141b6e67 100644
+--- a/Include/cpython/pystate.h
++++ b/Include/cpython/pystate.h
+@@ -6,7 +6,7 @@
+ extern "C" {
+ #endif
+ 
+-#include "cpython/initconfig.h"
++#include "initconfig.h"
+ 
+ PyAPI_FUNC(int) _PyInterpreterState_RequiresIDRef(PyInterpreterState *);
+ PyAPI_FUNC(void) _PyInterpreterState_RequireIDRef(PyInterpreterState *, int);
+-- 
+2.24.1
+
-- 
2.24.1
