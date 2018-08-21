From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Aug 2018 23:39:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/rtorrent: bump version to 0.9.7
Message-ID: <20180821213949.32148-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, rebased patch 0001.

Fixes
http://autobuild.buildroot.net/results/9c6/9c64888e96d59cb536dc7ccaa52f731118e69ce1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rtorrent/0001-cross_compile.patch | 31 ++++++++---------------
 package/rtorrent/rtorrent.hash            |  3 ++-
 package/rtorrent/rtorrent.mk              |  2 +-
 3 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/package/rtorrent/0001-cross_compile.patch b/package/rtorrent/0001-cross_compile.patch
index a8ad696e6d..1c40eaebb3 100644
--- a/package/rtorrent/0001-cross_compile.patch
+++ b/package/rtorrent/0001-cross_compile.patch
@@ -4,29 +4,18 @@ Date: Mon, 5 Oct 2015 00:52:26 +0100
 Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
 
 [Vincent: tweak the patch for version 0.9.6]
+[Bernd: tweak the patch for version 0.9.7]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- configure.ac      |    1 -
- scripts/checks.m4 |    2 +-
- scripts/common.m4 |    4 ++--
- 3 files changed, 3 insertions(+), 4 deletions(-)
+ scripts/checks.m4 | 2 +-
+ scripts/common.m4 | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index ba5bbf2..0821d4e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,7 +4,6 @@ AC_DEFINE(API_VERSION, 9, api version)
- 
- AM_INIT_AUTOMAKE
- AC_CONFIG_HEADERS(config.h)
--AM_PATH_CPPUNIT(1.9.6)
- 
- AC_PROG_CXX
- AC_PROG_LIBTOOL
 diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 598f39b..0e5abe0 100644
+index 8d77fc5..c446995 100644
 --- a/scripts/checks.m4
 +++ b/scripts/checks.m4
 @@ -96,7 +96,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
@@ -39,10 +28,10 @@ index 598f39b..0e5abe0 100644
        #include <stdlib.h>
        #include <unistd.h>
 diff --git a/scripts/common.m4 b/scripts/common.m4
-index 5127624..cc68269 100644
+index 9885b03..a0af7e7 100644
 --- a/scripts/common.m4
 +++ b/scripts/common.m4
-@@ -223,7 +223,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
+@@ -153,7 +153,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
  AC_DEFUN([TORRENT_CHECK_EXECINFO], [
    AC_MSG_CHECKING(for execinfo.h)
  
@@ -51,7 +40,7 @@ index 5127624..cc68269 100644
        #include <execinfo.h>
        int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
        ])],
-@@ -238,7 +238,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
+@@ -168,7 +168,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
  AC_DEFUN([TORRENT_CHECK_ALIGNED], [
    AC_MSG_CHECKING(the byte alignment)
  
@@ -61,5 +50,5 @@ index 5127624..cc68269 100644
        int main() {
          char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
 -- 
-1.7.1
+2.18.0
 
diff --git a/package/rtorrent/rtorrent.hash b/package/rtorrent/rtorrent.hash
index 15257acf43..9f5ef2b4fc 100644
--- a/package/rtorrent/rtorrent.hash
+++ b/package/rtorrent/rtorrent.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1e69c24f1f26f8f07d58d673480dc392bfc4317818c1115265b08a7813ff5b0e  rtorrent-0.9.6.tar.gz
+sha256 5d9842fe48c9582fbea2c7bf9f51412c1ccbba07d059b257039ad53b863fe8bb  rtorrent-0.9.7.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index 51dc9eecc9..aaf86be647 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTORRENT_VERSION = 0.9.6
+RTORRENT_VERSION = 0.9.7
 RTORRENT_SITE = http://rtorrent.net/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_AUTORECONF = YES
-- 
2.18.0
