From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 03:45:53 +0200
Subject: [Buildroot] [PATCH 5/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1356745553-15362-6-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc does not have execinfo.h

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/x11r7/mesa3d/mesa3d-execinfo.patch |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/mesa3d/mesa3d-execinfo.patch

diff --git a/package/x11r7/mesa3d/mesa3d-execinfo.patch b/package/x11r7/mesa3d/mesa3d-execinfo.patch
new file mode 100644
index 0000000..8baba63
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-execinfo.patch
@@ -0,0 +1,21 @@
+diff -Naur mesa3d-8.0.5.org/src/gallium/auxiliary/util/u_debug_symbol.c mesa3d-8.0.5/src/gallium/auxiliary/util/u_debug_symbol.c
+--- mesa3d-8.0.5.org/src/gallium/auxiliary/util/u_debug_symbol.c	2012-12-29 00:23:42.597893058 +0200
++++ mesa3d-8.0.5/src/gallium/auxiliary/util/u_debug_symbol.c	2012-12-29 00:26:08.639454184 +0200
+@@ -151,7 +151,7 @@
+ }
+ #endif
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ #include <execinfo.h>
+ 
+ /* This can only provide dynamic symbols, or binary offsets into a file.
+@@ -177,7 +177,7 @@
+       return;
+ #endif
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+    debug_symbol_name_glibc(addr, buf, size);
+    if(buf[0])
+       return;
-- 
1.7.7.6
