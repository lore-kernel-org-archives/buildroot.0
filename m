From: Michael Fischer <mf@go-sys.de>
Date: Thu, 6 Aug 2020 15:03:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: bump version to 5.4.0
Message-ID: <20200806130339.20461-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-configure-add-without-demo-option: adapt patch to 5.4.0 version

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...01-configure-add-without-demo-option.patch | 33 ++++++++++---------
 package/gnuplot/gnuplot.hash                  |  8 ++---
 package/gnuplot/gnuplot.mk                    |  2 +-
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/package/gnuplot/0001-configure-add-without-demo-option.patch b/package/gnuplot/0001-configure-add-without-demo-option.patch
index a50e6c2c1b..8b94a6ce8b 100644
--- a/package/gnuplot/0001-configure-add-without-demo-option.patch
+++ b/package/gnuplot/0001-configure-add-without-demo-option.patch
@@ -4,13 +4,12 @@ Originally written by Anthony Viallard
 <viallard@syscom-instruments.com>.
 
 [Vincent: adapt patch to 5.0.5 version]
+[Michael: adapt patch to 5.4.0 version]
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
---- a/configure.ac	2019-11-27 23:52:29.000000000 +0100
-+++ b/configure.ac	2020-02-13 10:24:50.801842269 +0100
-@@ -755,6 +755,16 @@ if test "$with_cwdrc" = yes; then
+diff -Naur a/configure.ac b/configure.ac
+--- a/configure.ac	2020-07-12 02:29:47.000000000 +0200
++++ b/configure.ac	2020-08-06 14:21:17.918756893 +0200
+@@ -713,6 +713,17 @@
                 [ Define if you want to read .gnuplot from current directory (SECURITY RISK!).])
  fi
  
@@ -24,10 +23,11 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 +AC_ARG_ENABLE(demo,dnl
 +[  --disable-demo    do not build demo files])
 +
- dnl Disable experimental support for nonlinear axes
- AC_ARG_WITH(nonlinear-axes,dnl
- [  --without-nonlinear-axes     disable support for nonlinear axes])
-@@ -1236,6 +1246,24 @@ if test -n "${DIST_CONTACT}"; then
++
+ dnl Sort help/subtopic tables by row or column
+ AC_ARG_WITH(row-help,dnl
+ [  --with-row-help         format help and subtopic tables by row (default)
+@@ -1095,6 +1106,24 @@
    AC_DEFINE_UNQUOTED([DIST_CONTACT],["$DIST_CONTACT"],[Contact address for modified and binary distributed gnuplot versions])
  fi
  
@@ -52,14 +52,15 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
  dnl Substitute variables
  AC_SUBST(PACKAGE)
  AC_SUBST(VERSION_MAJOR)
---- a/Makefile.am	2019-11-19 22:57:18.000000000 +0100
-+++ b/Makefile.am	2020-02-13 10:17:55.753012739 +0100
+diff -Naur a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2020-03-31 19:28:16.000000000 +0200
++++ b/Makefile.am	2020-08-06 14:34:12.995097799 +0200
 @@ -1,7 +1,7 @@
  ## Process this file with automake to produce Makefile.in -*-Makefile-*-
  AUTOMAKE_OPTIONS = foreign
  
--SUBDIRS = config m4 term src docs man demo tutorial share
-+SUBDIRS = config m4 term src $(DOCSUBDIR) man $(DEMOSUBDIR) tutorial share
+-SUBDIRS = config m4 term src docs man demo share
++SUBDIRS = config m4 term src $(DOCSUBDIR) man $(DEMOSUBDIR) share
  
- EXTRA_DIST = BUGS Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
- Makefile.maint PATCHLEVEL PGPKEYS README RELEASE_NOTES \
+ EXTRA_DIST = BUGS Copyright FAQ.pdf INSTALL INSTALL.gnu \
+ PATCHLEVEL PGPKEYS README RELEASE_NOTES \
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index ef80a29d3d..260b78314e 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.2.8/
-md5 2df8767c7399bee57a96296d46b4d5fb  gnuplot-5.2.8.tar.gz
-sha1 dc018b1e0a31b770d4635958badff13498babc4d  gnuplot-5.2.8.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.0/
+md5 ac586178f3b031dea82cd3890cefb21b  gnuplot-5.4.0.tar.gz
+sha1 b4660dff7d047a453c55fd77faba11f63bb2d5ed  gnuplot-5.4.0.tar.gz
 # Locally computed
-sha256  60a6764ccf404a1668c140f11cc1f699290ab70daa1151bb58fed6139a28ac37  gnuplot-5.2.8.tar.gz
+sha256  eb4082f03a399fd1e9e2b380cf7a4f785e77023d8dcc7e17570c1b5570a49c47  gnuplot-5.4.0.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 694b6cb886..ef9ef2ac67 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.2.8
+GNUPLOT_VERSION = 5.4.0
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.28.0
