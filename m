From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Aug 2019 13:16:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/rtorrent: bump to version 0.9.8
In-Reply-To: <20190801111654.31714-1-fontaine.fabrice@gmail.com>
References: <20190801111654.31714-1-fontaine.fabrice@gmail.com>
Message-ID: <20190801111654.31714-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version) and drop AUTORECONF as it is not
needed anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtorrent/0001-cross_compile.patch | 54 -----------------------
 package/rtorrent/rtorrent.hash            |  2 +-
 package/rtorrent/rtorrent.mk              |  3 +-
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 package/rtorrent/0001-cross_compile.patch

diff --git a/package/rtorrent/0001-cross_compile.patch b/package/rtorrent/0001-cross_compile.patch
deleted file mode 100644
index 1c40eaebb3..0000000000
--- a/package/rtorrent/0001-cross_compile.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From d62f7474289970d5be3fd658dd6ace4489408bdf Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Mon, 5 Oct 2015 00:52:26 +0100
-Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
-
-[Vincent: tweak the patch for version 0.9.6]
-[Bernd: tweak the patch for version 0.9.7]
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- scripts/checks.m4 | 2 +-
- scripts/common.m4 | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 8d77fc5..c446995 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -96,7 +96,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
- AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
-   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
- 
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <fcntl.h>
-       #include <stdlib.h>
-       #include <unistd.h>
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index 9885b03..a0af7e7 100644
---- a/scripts/common.m4
-+++ b/scripts/common.m4
-@@ -153,7 +153,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
- AC_DEFUN([TORRENT_CHECK_EXECINFO], [
-   AC_MSG_CHECKING(for execinfo.h)
- 
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <execinfo.h>
-       int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
-       ])],
-@@ -168,7 +168,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
- AC_DEFUN([TORRENT_CHECK_ALIGNED], [
-   AC_MSG_CHECKING(the byte alignment)
- 
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <inttypes.h>
-       int main() {
-         char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
--- 
-2.18.0
-
diff --git a/package/rtorrent/rtorrent.hash b/package/rtorrent/rtorrent.hash
index 9f5ef2b4fc..a20e63782b 100644
--- a/package/rtorrent/rtorrent.hash
+++ b/package/rtorrent/rtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5d9842fe48c9582fbea2c7bf9f51412c1ccbba07d059b257039ad53b863fe8bb  rtorrent-0.9.7.tar.gz
+sha256 9edf0304bf142215d3bc85a0771446b6a72d0ad8218efbe184b41e4c9c7542af  rtorrent-0.9.8.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index aaf86be647..bc3afe8064 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-RTORRENT_VERSION = 0.9.7
+RTORRENT_VERSION = 0.9.8
 RTORRENT_SITE = http://rtorrent.net/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
-RTORRENT_AUTORECONF = YES
 RTORRENT_LICENSE = GPL-2.0
 RTORRENT_LICENSE_FILES = COPYING
 
-- 
2.20.1
