From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] squid: bump to version 3.1.10
Message-ID: <20101222232251.098818E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d417a5634e301b3e83204ca56d5c775f129e3335
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid-cross-compile.patch |   20 ++++++++++----------
 package/squid/squid.mk                  |    2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/squid/squid-cross-compile.patch b/package/squid/squid-cross-compile.patch
index f2ce705..98424ae 100644
--- a/package/squid/squid-cross-compile.patch
+++ b/package/squid/squid-cross-compile.patch
@@ -1,7 +1,7 @@
-diff -Nura squid-3.1.8.orig/configure.in squid-3.1.8/configure.in
---- squid-3.1.8.orig/configure.in	2010-09-04 00:26:52.000000000 -0300
-+++ squid-3.1.8/configure.in	2010-09-06 10:12:09.036622139 -0300
-@@ -366,7 +366,7 @@
+diff -Nura squid-3.1.10.orig/configure.ac squid-3.1.10/configure.ac
+--- squid-3.1.10.orig/configure.ac	2010-12-22 02:48:27.000000000 -0300
++++ squid-3.1.10/configure.ac	2010-12-22 11:31:08.420533635 -0300
+@@ -384,7 +384,7 @@
  
  dnl Nasty hack to get autoconf 2.64 on Linux to run.
  dnl all other uses of RUN_IFELSE are wrapped inside CACHE_CHECK which breaks on 2.64
@@ -10,7 +10,7 @@ diff -Nura squid-3.1.8.orig/configure.in squid-3.1.8/configure.in
  
  dnl This is a developer only option.. developers know how to set defines
  dnl
-@@ -1802,7 +1802,7 @@
+@@ -1889,7 +1889,7 @@
      AC_MSG_NOTICE([Negotiate auth helpers built: $NEGOTIATE_AUTH_HELPERS])
  fi
  AC_SUBST(NEGOTIATE_AUTH_HELPERS)
@@ -19,7 +19,7 @@ diff -Nura squid-3.1.8.orig/configure.in squid-3.1.8/configure.in
  
  dnl Select digest auth scheme helpers to build
  if test -n "$AUTH_MODULE_digest"; then
-@@ -2115,6 +2115,18 @@
+@@ -2202,6 +2202,18 @@
  	;;
  esac
  
@@ -38,9 +38,9 @@ diff -Nura squid-3.1.8.orig/configure.in squid-3.1.8/configure.in
  dnl Check for programs
  AC_PROG_CPP
  AC_PROG_INSTALL
-diff -Nura squid-3.1.8.orig/src/Makefile.am squid-3.1.8/src/Makefile.am
---- squid-3.1.8.orig/src/Makefile.am	2010-09-04 00:25:57.000000000 -0300
-+++ squid-3.1.8/src/Makefile.am	2010-09-06 10:11:27.319774138 -0300
+diff -Nura squid-3.1.10.orig/src/Makefile.am squid-3.1.10/src/Makefile.am
+--- squid-3.1.10.orig/src/Makefile.am	2010-12-22 02:46:56.000000000 -0300
++++ squid-3.1.10/src/Makefile.am	2010-12-22 11:31:08.422533643 -0300
 @@ -195,8 +195,6 @@
  cf_gen_SOURCES = cf_gen.cc
  nodist_cf_gen_HEADER = cf_gen_defines.cci
@@ -50,7 +50,7 @@ diff -Nura squid-3.1.8.orig/src/Makefile.am squid-3.1.8/src/Makefile.am
  	$(EPOLL_LIBS) \
  	$(MINGW_LIBS) \
  	$(XTRA_LIBS)
-@@ -752,6 +750,12 @@
+@@ -753,6 +751,12 @@
  squid.conf.default squid.conf.documented: cf_parser.cci
  	true
  
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 313659f..3afa07d 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.1.9
+SQUID_VERSION = 3.1.10
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
 SQUID_DEPENDENCIES = libcap host-libcap
 SQUID_AUTORECONF = YES
-- 
1.7.2.2
