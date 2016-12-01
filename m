From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 1 Dec 2016 12:23:33 +0000
Subject: [Buildroot] [PATCH next] gnuplot: bump version to 5.0.5
Message-ID: <20161201122333.57151-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- 0001-configure-add-without-demo-option.patch adapted to new version.
- --without-lisp-files configure option removed: doesn't exist anymore.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../0001-configure-add-without-demo-option.patch   | 61 +++++++++++-----------
 package/gnuplot/gnuplot.hash                       |  6 +--
 package/gnuplot/gnuplot.mk                         |  3 +-
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/gnuplot/0001-configure-add-without-demo-option.patch b/package/gnuplot/0001-configure-add-without-demo-option.patch
index ccca4e3..a9abfd0 100644
--- a/package/gnuplot/0001-configure-add-without-demo-option.patch
+++ b/package/gnuplot/0001-configure-add-without-demo-option.patch
@@ -3,42 +3,35 @@ Add options to enable/disable docs and demos
 Originally written by Anthony Viallard
 <viallard@syscom-instruments.com>.
 
+[Vincent: adapt patch to 5.0.5 version]
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-Index: gnuplot-4.6.0/configure.in
-===================================================================
---- gnuplot-4.6.0.orig/configure.in	2012-03-08 05:34:42.000000000 +0100
-+++ gnuplot-4.6.0/configure.in	2013-01-07 11:50:03.003804463 +0100
-@@ -748,6 +748,16 @@
- AC_ARG_WITH(lisp-files,dnl
- [  --without-lisp-files    do not build emacs lisp files])
+diff -rup a/configure.in b/configure.in
+--- a/configure.in	2016-09-07 05:14:29.000000000 +0100
++++ b/configure.in	2016-12-01 12:09:31.487464774 +0000
+@@ -818,6 +818,16 @@ if test "$with_cwdrc" = yes; then
+                [ Define if you want to read .gnuplot from current directory (SECURITY RISK!).])
+ fi
  
-+dnl Whether we want to build the demo files
-+dnl Does nothing here, is passed on to the demo subdir
-+AC_ARG_ENABLE(demo,dnl
-+[  --disable-demo    do not build demo files])
-+
 +dnl Whether we want to build the doc files
 +dnl Does nothing here, is passed on to the doc subdir
 +AC_ARG_ENABLE(doc,dnl
 +[  --disable-doc    do not build doc files])
 +
++dnl Whether we want to build the demo files
++dnl Does nothing here, is passed on to the demo subdir
++AC_ARG_ENABLE(demo,dnl
++[  --disable-demo    do not build demo files])
++
  dnl Sort help/subtopic tables by row or column
  AC_ARG_WITH(row-help,dnl
  [  --with-row-help         format help and subtopic tables by row (default)
-@@ -1200,6 +1210,24 @@
- fi
- AC_SUBST(LISPDIR)
+@@ -1303,6 +1313,24 @@ fi
+ dnl No configuration option for this one yet
+ AC_DEFINE(MAX_PARALLEL_AXES,7, [Maximum number of parallel axes supported])
  
-+dnl build demo files
-+if test "$enable_demo" != no; then
-+  AC_CONFIG_SUBDIRS(demo)
-+  DEMOSUBDIR=demo
-+else
-+  DEMOSUBDIR=
-+fi
-+AC_SUBST(DEMOSUBDIR)
-+
 +dnl build doc files
 +if test "$enable_doc" != no; then
 +  AC_CONFIG_SUBDIRS(docs)
@@ -48,19 +41,27 @@ Index: gnuplot-4.6.0/configure.in
 +fi
 +AC_SUBST(DOCSUBDIR)
 +
++dnl build demo files
++if test "$enable_demo" != no; then
++  AC_CONFIG_SUBDIRS(demo)
++  DEMOSUBDIR=demo
++else
++  DEMOSUBDIR=
++fi
++AC_SUBST(DEMOSUBDIR)
++
  dnl Substitute variables
  AC_SUBST(PACKAGE)
  AC_SUBST(VERSION_MAJOR)
-Index: gnuplot-4.6.0/Makefile.am
-===================================================================
---- gnuplot-4.6.0.orig/Makefile.am	2013-01-04 14:07:02.239120935 +0100
-+++ gnuplot-4.6.0/Makefile.am	2013-01-07 11:51:12.034846363 +0100
+diff -rup a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2014-05-30 17:38:08.000000000 +0100
++++ b/Makefile.am	2016-12-01 12:09:31.488464794 +0000
 @@ -1,7 +1,7 @@
  ## Process this file with automake to produce Makefile.in -*-Makefile-*-
- AUTOMAKE_OPTIONS = foreign 1.2h
+ AUTOMAKE_OPTIONS = foreign
  
 -SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
 +SUBDIRS = config m4 term src $(DOCSUBDIR) $(LISPDIR) man $(DEMOSUBDIR) tutorial share
  
  EXTRA_DIST = BUGS CodeStyle Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
- Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST \
+ Makefile.maint PATCHLEVEL PGPKEYS PORTING README RELEASE_NOTES \
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 37cc3e7..a71d006 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/gnuplot/files/gnuplot/4.6.6/
-md5	02a980b37ba181f7510816ed6440c9c1	gnuplot-4.6.6.tar.gz
-sha1	012bd22b7be32da186b6bb015c0c6d876926c90b	gnuplot-4.6.6.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.0.5/
+md5 c5e96fca73afbee4f57cbc1bfce6b3b8  gnuplot-5.0.5.tar.gz
+sha1 c35f55657fdc33217dd70bbf3148578563ecaad1  gnuplot-5.0.5.tar.gz
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index a9e1204..3e00eef 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 4.6.6
+GNUPLOT_VERSION = 5.0.5
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
@@ -19,7 +19,6 @@ GNUPLOT_CONF_OPTS = \
 	--disable-demo \
 	--without-row-help \
 	--disable-history-file \
-	--without-lisp-files \
 	--disable-wxwidgets \
 	--without-lua \
 	--without-latex \
-- 
2.10.1
