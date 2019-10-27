From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Oct 2019 18:49:48 +0100
Subject: [Buildroot] [PATCH 2/3] package/libsigrok: fix C++ build with
 doxygen 1.8.16
In-Reply-To: <20191027174949.13805-1-fontaine.fabrice@gmail.com>
References: <20191027174949.13805-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027174949.13805-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/f1d0868e99402954dc96773c5ace192525deeab8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ompilation-with-newer-Doxygen-1-8-16.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/libsigrok/0001-build-unbreak-C++-binding-compilation-with-newer-Doxygen-1-8-16.patch

diff --git a/package/libsigrok/0001-build-unbreak-C++-binding-compilation-with-newer-Doxygen-1-8-16.patch b/package/libsigrok/0001-build-unbreak-C++-binding-compilation-with-newer-Doxygen-1-8-16.patch
new file mode 100644
index 0000000000..9a5eab4685
--- /dev/null
+++ b/package/libsigrok/0001-build-unbreak-C++-binding-compilation-with-newer-Doxygen-1-8-16.patch
@@ -0,0 +1,35 @@
+From 2da97803e653b814db3a42b3b749953368932cb6 Mon Sep 17 00:00:00 2001
+From: Gerhard Sittig <gerhard.sittig@gmx.net>
+Date: Sun, 6 Oct 2019 10:08:09 +0200
+Subject: [PATCH] build: unbreak C++ binding compilation with newer Doxygen
+ (1.8.16)
+
+Doxygen version 1.8.16 introduced an issue which breaks the compilation
+of sigrok's C++ binding (https://github.com/doxygen/doxygen/issues/7190).
+Don't set the FILE_PATTERNS variable at all, instead of assigning an
+empty value. This resolves bug #1422.
+
+[Retrieved from:
+https://github.com/sigrokproject/libsigrok/commit/2da97803e653b814db3a42b3b749953368932cb6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Doxyfile | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Doxyfile b/Doxyfile
+index 252e504e..76f410a0 100644
+--- a/Doxyfile
++++ b/Doxyfile
+@@ -763,7 +763,11 @@ INPUT_ENCODING         = UTF-8
+ # *.md, *.mm, *.dox, *.py, *.f90, *.f, *.for, *.tcl, *.vhd, *.vhdl, *.ucf,
+ # *.qsf, *.as and *.js.
+ 
+-FILE_PATTERNS          =
++# BEWARE! DON'T set the variable to an empty value. Don't set the variable
++# at all instead. See https://github.com/doxygen/doxygen/issues/7190 and
++# https://sigrok.org/bugzilla/show_bug.cgi?id=1422 (can get reverted when
++# the Doxygen version which causes the issue no longer is used in the wild).
++## FILE_PATTERNS          =
+ 
+ # The RECURSIVE tag can be used to specify whether or not subdirectories should
+ # be searched for input files as well.
-- 
2.23.0
