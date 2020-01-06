From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2020 13:02:11 +0100
Subject: [Buildroot] [git commit] package/libsigrok: bump to v0.5.2
Message-ID: <20200106120633.5B57D8EE2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0304066e5deb82601f79427113e7f5c72d55494
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the patch that's now upstream.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ing-compilation-with-newer-Doxygen-1-8-16.patch | 35 ----------------------
 package/libsigrok/libsigrok.hash                   |  2 +-
 package/libsigrok/libsigrok.mk                     |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/libsigrok/0001-build-unbreak-C++-binding-compilation-with-newer-Doxygen-1-8-16.patch b/package/libsigrok/0001-build-unbreak-C++-binding-compilation-with-newer-Doxygen-1-8-16.patch
deleted file mode 100644
index 9a5eab4685..0000000000
--- a/package/libsigrok/0001-build-unbreak-C++-binding-compilation-with-newer-Doxygen-1-8-16.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2da97803e653b814db3a42b3b749953368932cb6 Mon Sep 17 00:00:00 2001
-From: Gerhard Sittig <gerhard.sittig@gmx.net>
-Date: Sun, 6 Oct 2019 10:08:09 +0200
-Subject: [PATCH] build: unbreak C++ binding compilation with newer Doxygen
- (1.8.16)
-
-Doxygen version 1.8.16 introduced an issue which breaks the compilation
-of sigrok's C++ binding (https://github.com/doxygen/doxygen/issues/7190).
-Don't set the FILE_PATTERNS variable at all, instead of assigning an
-empty value. This resolves bug #1422.
-
-[Retrieved from:
-https://github.com/sigrokproject/libsigrok/commit/2da97803e653b814db3a42b3b749953368932cb6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Doxyfile | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Doxyfile b/Doxyfile
-index 252e504e..76f410a0 100644
---- a/Doxyfile
-+++ b/Doxyfile
-@@ -763,7 +763,11 @@ INPUT_ENCODING         = UTF-8
- # *.md, *.mm, *.dox, *.py, *.f90, *.f, *.for, *.tcl, *.vhd, *.vhdl, *.ucf,
- # *.qsf, *.as and *.js.
- 
--FILE_PATTERNS          =
-+# BEWARE! DON'T set the variable to an empty value. Don't set the variable
-+# at all instead. See https://github.com/doxygen/doxygen/issues/7190 and
-+# https://sigrok.org/bugzilla/show_bug.cgi?id=1422 (can get reverted when
-+# the Doxygen version which causes the issue no longer is used in the wild).
-+## FILE_PATTERNS          =
- 
- # The RECURSIVE tag can be used to specify whether or not subdirectories should
- # be searched for input files as well.
diff --git a/package/libsigrok/libsigrok.hash b/package/libsigrok/libsigrok.hash
index e5ab5d9736..0898a2fba0 100644
--- a/package/libsigrok/libsigrok.hash
+++ b/package/libsigrok/libsigrok.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	e40fde7af98d29e922e9d3cbe0a6c0569889153fc31e47b8b1afe4d846292b9c	libsigrok-0.5.1.tar.gz
+sha256	4d341f90b6220d3e8cb251dacf726c41165285612248f2c52d15df4590a1ce3c	libsigrok-0.5.2.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index aa79191e94..971e90c94a 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 0.5.1
+LIBSIGROK_VERSION = 0.5.2
 LIBSIGROK_SITE = http://sigrok.org/download/source/libsigrok
 LIBSIGROK_LICENSE = GPL-3.0+
 LIBSIGROK_LICENSE_FILES = COPYING
