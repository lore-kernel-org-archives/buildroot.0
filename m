From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Oct 2012 14:23:33 -0300
Subject: [Buildroot] [PATCH 1/2] libtorrent: bump to version 0.13.3
Message-ID: <1351704214-11511-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtorrent/libtorrent-cross_compile.patch |   30 ++++++++++++++------
 package/libtorrent/libtorrent.mk                  |    4 ++-
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/package/libtorrent/libtorrent-cross_compile.patch b/package/libtorrent/libtorrent-cross_compile.patch
index 39fe700..f86f289 100644
--- a/package/libtorrent/libtorrent-cross_compile.patch
+++ b/package/libtorrent/libtorrent-cross_compile.patch
@@ -2,20 +2,20 @@ Fix cross compilation, based on OpenWRT patch.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura libtorrent-0.13.2/configure.ac libtorrent-0.13.2-cross/configure.ac
---- libtorrent-0.13.2/configure.ac	2012-04-20 03:55:10.000000000 -0300
-+++ libtorrent-0.13.2-cross/configure.ac	2012-05-09 10:57:49.671175421 -0300
-@@ -17,7 +17,6 @@
+diff -Nura libtorrent-0.13.3.orig/configure.ac libtorrent-0.13.3/configure.ac
+--- libtorrent-0.13.3.orig/configure.ac	2012-10-31 07:38:59.345752076 -0300
++++ libtorrent-0.13.3/configure.ac	2012-10-31 07:39:06.454799361 -0300
+@@ -19,7 +19,6 @@
  
  AM_INIT_AUTOMAKE
  AM_CONFIG_HEADER(config.h)
 -AM_PATH_CPPUNIT(1.9.6)
- AC_DISABLE_STATIC
  
- AM_DISABLE_STATIC
-diff -Nura libtorrent-0.13.2/scripts/checks.m4 libtorrent-0.13.2-cross/scripts/checks.m4
---- libtorrent-0.13.2/scripts/checks.m4	2012-04-12 06:44:23.000000000 -0300
-+++ libtorrent-0.13.2-cross/scripts/checks.m4	2012-05-09 10:42:32.642728917 -0300
+ AC_PROG_CXX
+ 
+diff -Nura libtorrent-0.13.3.orig/scripts/checks.m4 libtorrent-0.13.3/scripts/checks.m4
+--- libtorrent-0.13.3.orig/scripts/checks.m4	2012-10-31 07:38:59.342752057 -0300
++++ libtorrent-0.13.3/scripts/checks.m4	2012-10-31 07:39:06.454799361 -0300
 @@ -96,7 +96,7 @@
  AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
    AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
@@ -25,3 +25,15 @@ diff -Nura libtorrent-0.13.2/scripts/checks.m4 libtorrent-0.13.2-cross/scripts/c
        #include <fcntl.h>
        #include <stdlib.h>
        #include <unistd.h>
+diff -Nura libtorrent-0.13.3.orig/scripts/common.m4 libtorrent-0.13.3/scripts/common.m4
+--- libtorrent-0.13.3.orig/scripts/common.m4	2012-10-31 07:38:59.342752057 -0300
++++ libtorrent-0.13.3/scripts/common.m4	2012-10-31 07:39:32.550972826 -0300
+@@ -223,7 +223,7 @@
+ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
+   AC_MSG_CHECKING(for execinfo.h)
+ 
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
++  AC_LINK_IFELSE([AC_LANG_SOURCE([
+       #include <execinfo.h>
+       int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
+       ])],
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index 892195b..e58de5d 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBTORRENT_VERSION = 0.13.2
+LIBTORRENT_VERSION = 0.13.3
 LIBTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
 LIBTORRENT_DEPENDENCIES = host-pkgconf libsigc \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
@@ -12,5 +12,7 @@ LIBTORRENT_CONF_OPT = --enable-aligned \
 	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
 LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_AUTORECONF = YES
+LIBTORRENT_LICENSE = GPLv2
+LIBTORRENT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
