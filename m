From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 11:56:37 +0200
Subject: [Buildroot] [git commit] dillo: bump version to 3.0.5
Message-ID: <20151016111136.67FF881F84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c079a9ad5e82d99c28e2d2dc03f7fff8ff4df4fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And remove upstream applied patch.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-change-fltk-config-test-to-be-more-cros.patch |   40 --------------------
 package/dillo/dillo.hash                           |    2 +-
 package/dillo/dillo.mk                             |    2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/dillo/0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch b/package/dillo/0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
deleted file mode 100644
index 2f184fb..0000000
--- a/package/dillo/0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b2ac6e42f0790bbe1704c468e740cb26293579a7 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 29 May 2014 21:29:18 +0200
-Subject: [PATCH] configure.ac: change fltk-config test to be more
- crosscompile/buildroot friendly
-
-Change fltk-config usage as suggested by Thomas Petazzoni [1].
-
-[1] http://lists.busybox.net/pipermail/buildroot/2014-May/097607.html
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e3ace75..e1f4b6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -112,12 +112,13 @@ dnl -------------------------
- dnl
- dnl For debugging and to be user friendly
- AC_MSG_CHECKING([FLTK 1.3])
--fltk_version="`fltk-config --version 2>/dev/null`"
-+AC_PATH_PROG(FLTK_CONFIG,fltk-config)
-+fltk_version="`$FLTK_CONFIG --version 2>/dev/null`"
- case $fltk_version in
-   1.3.*) AC_MSG_RESULT(yes)
--         LIBFLTK_CXXFLAGS=`fltk-config --cxxflags`
--         LIBFLTK_CFLAGS=`fltk-config --cflags`
--         LIBFLTK_LIBS=`fltk-config --ldflags`;;
-+         LIBFLTK_CXXFLAGS=`$FLTK_CONFIG --cxxflags`
-+         LIBFLTK_CFLAGS=`$FLTK_CONFIG --cflags`
-+         LIBFLTK_LIBS=`$FLTK_CONFIG --ldflags`;;
-   ?*)    AC_MSG_RESULT(no)
-          AC_MSG_ERROR(FLTK 1.3 required; version found: $fltk_version);;
-   *)     AC_MSG_RESULT(no)
--- 
-1.8.1.4
-
diff --git a/package/dillo/dillo.hash b/package/dillo/dillo.hash
index 927db62..cab0b14 100644
--- a/package/dillo/dillo.hash
+++ b/package/dillo/dillo.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ed97c48029ad1fe62c8a505f81c6ea127532697374153e652065fc6ced098647	dillo-3.0.4.1.tar.bz2
+sha256 db1be16c1c5842ebe07b419aa7c6ef11a45603a75df2877f99635f4f8345148b dillo-3.0.5.tar.bz2
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 4ce63d5..8eb8d88 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DILLO_VERSION = 3.0.4.1
+DILLO_VERSION = 3.0.5
 DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
 DILLO_SITE = http://www.dillo.org/download
 DILLO_LICENSE = GPLv3+
