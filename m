From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  5 Jun 2017 12:48:37 +0200
Subject: [Buildroot] [PATCH] package/sunxy-mali: fix conflicting types for
	GLintptr and GLsizeiptr
Message-ID: <20170605104837.15929-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When OpenGL ES 1.1 and OpenGL ES 2.0 are used at the same time, the
build fail since GLintptr and GLsizeiptr data type are not the same in
GLES2/gl2.h and GLES/gl.h.

Fixes:
http://autobuild.buildroot.net/results/258/25898b45cefde9661d8ac87dd84bc883bb5283d1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Spenser Gilliland <spenser@gillilanding.com>
---
 ...ting-types-for-GLintptr-and-GLsizeiptr-in.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/sunxi-mali/0003-fix-conflicting-types-for-GLintptr-and-GLsizeiptr-in.patch

diff --git a/package/sunxi-mali/0003-fix-conflicting-types-for-GLintptr-and-GLsizeiptr-in.patch b/package/sunxi-mali/0003-fix-conflicting-types-for-GLintptr-and-GLsizeiptr-in.patch
new file mode 100644
index 0000000..7af48f5
--- /dev/null
+++ b/package/sunxi-mali/0003-fix-conflicting-types-for-GLintptr-and-GLsizeiptr-in.patch
@@ -0,0 +1,36 @@
+From 677e777407032364c9e0a35b4aaa8a6b4a405253 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 5 Jun 2017 12:40:16 +0200
+Subject: [PATCH] fix conflicting types for GLintptr and GLsizeiptr in
+ GLES2/gl2.h and GLES/gl.h
+
+When OpenGL ES 1.1 and OpenGL ES 2.0 are used at the same time, the
+build fail since GLintptr and GLsizeiptr data type are not the same in
+GLES2/gl2.h and GLES/gl.h.
+
+Fixes:
+http://autobuild.buildroot.net/results/258/25898b45cefde9661d8ac87dd84bc883bb5283d1
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/GLES/gl.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/GLES/gl.h b/include/GLES/gl.h
+index 858f394..a1a6c1a 100644
+--- a/include/GLES/gl.h
++++ b/include/GLES/gl.h
+@@ -30,8 +30,8 @@ typedef float  GLclampf;
+ typedef signed int  GLfixed;
+ typedef signed int  GLclampx;
+ 
+-typedef int * GLintptr;
+-typedef int *  GLsizeiptr;
++typedef khronos_intptr_t GLintptr;
++typedef khronos_ssize_t  GLsizeiptr;
+ 
+ 
+ /*************************************************************/
+-- 
+2.9.4
+
-- 
2.9.4
