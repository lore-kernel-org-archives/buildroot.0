From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:56:48 +0200
Subject: [Buildroot] [git commit] libtorrent: use patch file names generated
 by git format-patch
Message-ID: <20180909135606.459B08397D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7abf197e21bdc0818aab34fde3d4d0a4d7b4bc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-cross-compilation-based-on-OpenWRT-patch.patch} | 19 +++++++++----------
 ...patch => 0002-Added-support-for-openssl-1.1.patch} |  5 ++++-
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/libtorrent/0001-cross_compile.patch b/package/libtorrent/0001-Fix-cross-compilation-based-on-OpenWRT-patch.patch
similarity index 79%
rename from package/libtorrent/0001-cross_compile.patch
rename to package/libtorrent/0001-Fix-cross-compilation-based-on-OpenWRT-patch.patch
index 9febfa7f3c..ba0c6127af 100644
--- a/package/libtorrent/0001-cross_compile.patch
+++ b/package/libtorrent/0001-Fix-cross-compilation-based-on-OpenWRT-patch.patch
@@ -1,4 +1,4 @@
-From c4cc0ba76c81e1967c648be423f5f0312ac9d87f Mon Sep 17 00:00:00 2001
+From c99179777d8f4cf69c51378b91ae580c49cb57a2 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Mon, 5 Oct 2015 00:40:25 +0100
 Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
@@ -10,13 +10,12 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- configure.ac      |    1 -
- scripts/checks.m4 |    2 +-
- scripts/common.m4 |    4 ++--
- 3 files changed, 3 insertions(+), 4 deletions(-)
+ scripts/checks.m4 | 2 +-
+ scripts/common.m4 | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 598f39b..0e5abe0 100644
+index 8d77fc5e..c446995b 100644
 --- a/scripts/checks.m4
 +++ b/scripts/checks.m4
 @@ -96,7 +96,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
@@ -29,10 +28,10 @@ index 598f39b..0e5abe0 100644
        #include <stdlib.h>
        #include <unistd.h>
 diff --git a/scripts/common.m4 b/scripts/common.m4
-index 5127624..cc68269 100644
+index ff023928..932b205c 100644
 --- a/scripts/common.m4
 +++ b/scripts/common.m4
-@@ -223,7 +223,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
+@@ -153,7 +153,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
  AC_DEFUN([TORRENT_CHECK_EXECINFO], [
    AC_MSG_CHECKING(for execinfo.h)
  
@@ -41,7 +40,7 @@ index 5127624..cc68269 100644
        #include <execinfo.h>
        int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
        ])],
-@@ -238,7 +238,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
+@@ -168,7 +168,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
  AC_DEFUN([TORRENT_CHECK_ALIGNED], [
    AC_MSG_CHECKING(the byte alignment)
  
@@ -51,5 +50,5 @@ index 5127624..cc68269 100644
        int main() {
          char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
 -- 
-1.7.1
+2.14.4
 
diff --git a/package/libtorrent/0002-openssl110.patch b/package/libtorrent/0002-Added-support-for-openssl-1.1.patch
similarity index 97%
rename from package/libtorrent/0002-openssl110.patch
rename to package/libtorrent/0002-Added-support-for-openssl-1.1.patch
index b0cfc2deef..463c8ac9bc 100644
--- a/package/libtorrent/0002-openssl110.patch
+++ b/package/libtorrent/0002-Added-support-for-openssl-1.1.patch
@@ -1,4 +1,4 @@
-From 7b29b6bd2547e72e22b9b7981df27092842d2a10 Mon Sep 17 00:00:00 2001
+From 9af3be81c75b44415a6e7efe19f8f89d55091f84 Mon Sep 17 00:00:00 2001
 From: rakshasa <sundell.software@gmail.com>
 Date: Tue, 20 Dec 2016 19:51:02 +0900
 Subject: [PATCH] Added support for openssl 1.1.
@@ -107,3 +107,6 @@ index aa653d45..7ec13165 100644
  #endif
  }
  
+-- 
+2.14.4
+
