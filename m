From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Oct 2013 00:07:50 +0200
Subject: [Buildroot] [git commit] package/weston: fix configure.ac for fbdev
	compositor
Message-ID: <20131011082158.CBE749B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6614f38411aecdc5d5d0ba5c849b195df874b1d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply patch from upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ompositor-fbdev-drop-dependency-on-libdrm.patch |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

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
