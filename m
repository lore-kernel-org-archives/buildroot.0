From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 23:05:22 +0200
Subject: [Buildroot] [PATCH 5/8] package/weston: fix configure.ac for fbdev
	compositor
In-Reply-To: <cover.1381438785.git.yann.morin.1998@free.fr>
References: <cover.1381438785.git.yann.morin.1998@free.fr>
Message-ID: <6f0be6d2fbd79e357cd189d3b7591d69a4d4253c.1381438785.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Apply patch from upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...ompositor-fbdev-drop-dependency-on-libdrm.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch

diff --git a/package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch b/package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch
new file mode 100644
index 0000000..dfc20de
--- /dev/null
+++ b/package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch
@@ -0,0 +1,22 @@
+commit 7b8e970ad1f1ef96db23b379a41edeb40ef1e8b6
+Author: Adrian Negreanu <adrian.m.negreanu@intel.com>
+Date:   Thu Sep 26 19:31:32 2013 +0300
+
+    compositor-fbdev: drop dependency on libdrm
+    
+    Signed-off-by: Adrian Negreanu <adrian.m.negreanu@intel.com>
+    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/configure.ac b/configure.ac
+index 7c2da44..a43bf5b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -190,7 +190,7 @@ AM_CONDITIONAL([ENABLE_FBDEV_COMPOSITOR],
+                [test x$enable_fbdev_compositor = xyes])
+ AS_IF([test x$enable_fbdev_compositor = xyes], [
+   AC_DEFINE([BUILD_FBDEV_COMPOSITOR], [1], [Build the fbdev compositor])
+-  PKG_CHECK_MODULES([FBDEV_COMPOSITOR], [libudev >= 136 mtdev >= 1.1.0 libdrm >= 2.4.30])
++  PKG_CHECK_MODULES([FBDEV_COMPOSITOR], [libudev >= 136 mtdev >= 1.1.0])
+ ])
+ 
+ AC_ARG_ENABLE([rdp-compositor], [  --enable-rdp-compositor],,
-- 
1.8.1.2
