From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Dec 2013 15:44:41 +0100
Subject: [Buildroot] [git commit] fluxbox: bump to 1.3.5
Message-ID: <20131220145309.6DC5F9BFA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdc12b9b62c5ceb428199dfc9c1f455241fb2239
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove obsolete patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluxbox/fluxbox-1.3.2-fix-configure.patch |   19 -------------------
 package/fluxbox/fluxbox.mk                        |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)

diff --git a/package/fluxbox/fluxbox-1.3.2-fix-configure.patch b/package/fluxbox/fluxbox-1.3.2-fix-configure.patch
deleted file mode 100644
index 2cb8273..0000000
--- a/package/fluxbox/fluxbox-1.3.2-fix-configure.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Avoid to call the imlib2-config that may be installed on the host system
-(even when --with-imlib2-prefix or --with-imlib2-exec-prefix is passed to
-the configure script), which totally screws up the resulting linker flags.
-
-Inspired by: http://git.fluxbox.org/fluxbox.git/commit/?id=b178bed60b5bd8b2c9ed0cbc67fd729ff3820589
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
---- fluxbox-1.3.2.orig/configure.in	2012-10-21 16:11:59.445749396 +0200
-+++ fluxbox-1.3.2/configure.in	2012-10-21 16:35:27.658390856 +0200
-@@ -443,8 +443,6 @@ if test x$enable_imlib2 = "xyes"; then
-       [
-          IMLIB2=true
-          AC_DEFINE(HAVE_IMLIB2, [], [Imlib2 support])
--         IMLIB2_LIBS=`imlib2-config --libs`
--         IMLIB2_CFLAGS=`imlib2-config --cflags`
-          LIBS="$LIBS $IMLIB2_LIBS"
-          CXXFLAGS="$CXXFLAGS $IMLIB2_CFLAGS"
-        ], [ AC_MSG_RESULT(no)]
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 262cb0d..2efa28c 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUXBOX_VERSION = 1.3.2
+FLUXBOX_VERSION = 1.3.5
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
 FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
 FLUXBOX_LICENSE = MIT
