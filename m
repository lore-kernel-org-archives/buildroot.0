From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:22:53 +0200
Subject: [Buildroot] [git commit] sunxi-mali: add missing GLchar definitions.
Message-ID: <20140421202323.29A259C5F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf4d3ebf286eeee6c2ec7d913afda4101b8ed105
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GLES and GLES2 header files provided by sunxi-mali do not define the
type "GLchar" and use "char" instead in the prototype of some functions.

In order to have some applications build (like cairo), a new patch has
been added to define the missing type.

This issue has been reported upstream some time ago, but the pull
request has not been merged yet.
(See https://github.com/linux-sunxi/sunxi-mali/pull/8).

Fixes http://autobuild.buildroot.net/results/2cb/2cb13a5bb92dabed219d49f49f0b9a2dfe65a0ca/.

[Thomas: add more details to the patch description, using the commit
log message details.]

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-mali-0001-Add-missing-GLchar-definitions.patch |   45 ++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/sunxi-mali/sunxi-mali-0001-Add-missing-GLchar-definitions.patch b/package/sunxi-mali/sunxi-mali-0001-Add-missing-GLchar-definitions.patch
new file mode 100644
index 0000000..a9370b0
--- /dev/null
+++ b/package/sunxi-mali/sunxi-mali-0001-Add-missing-GLchar-definitions.patch
@@ -0,0 +1,45 @@
+From 058d5e8cd90d117535b5d314fd9e15c70028ff20 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Mon, 21 Apr 2014 19:31:23 +0200
+Subject: [PATCH] Add missing GLchar definitions.
+
+The GLES and GLES2 header files provided by sunxi-mali do not define the
+type "GLchar" and use "char" instead in the prototype of some functions.
+
+This issue has been reported upstream some time ago, but the pull
+request has not been merged yet.  (See
+https://github.com/linux-sunxi/sunxi-mali/pull/8).
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ include/GLES/gl.h   | 1 +
+ include/GLES2/gl2.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/include/GLES/gl.h b/include/GLES/gl.h
+index 858f394..a6bb591 100644
+--- a/include/GLES/gl.h
++++ b/include/GLES/gl.h
+@@ -29,6 +29,7 @@ typedef float  GLfloat;
+ typedef float  GLclampf;
+ typedef signed int  GLfixed;
+ typedef signed int  GLclampx;
++typedef char GLchar;
+ 
+ typedef int * GLintptr;
+ typedef int *  GLsizeiptr;
+diff --git a/include/GLES2/gl2.h b/include/GLES2/gl2.h
+index 59e376c..90d96bb 100644
+--- a/include/GLES2/gl2.h
++++ b/include/GLES2/gl2.h
+@@ -32,6 +32,7 @@ typedef unsigned int     GLuint;
+ typedef khronos_float_t  GLfloat;
+ typedef khronos_float_t  GLclampf;
+ typedef khronos_int32_t  GLfixed;
++typedef char             GLchar;
+ 
+ /* GL types for handling large vertex buffer objects */
+ typedef khronos_intptr_t GLintptr;
+-- 
+1.9.0
+
