From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:28:45 +0200
Subject: [Buildroot] [git commit] Revert "sqlite: bump to version 3.7.17"
Message-ID: <20130528213107.84B789A621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d8d884e5d3b28000ea83b9b538900e476c21dd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ddddef3e6e52b4205306190e4a3830fad06d23aa.

This was supposed to have been for next, not 2013.05.
---
 .../sqlite/sqlite-dont-force-posix-fallocate.patch |   23 --------------------
 package/sqlite/sqlite.mk                           |    4 +-
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/package/sqlite/sqlite-dont-force-posix-fallocate.patch b/package/sqlite/sqlite-dont-force-posix-fallocate.patch
deleted file mode 100644
index 118001b..0000000
--- a/package/sqlite/sqlite-dont-force-posix-fallocate.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-This is checked by configure and passed as a define directive when building.
-There's no need to check again and potentially override a failed check
-(uClibc <= 0.9.33.2 for example lacks posix_fallocate).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura sqlite-autoconf-3071700.orig/sqlite3.c sqlite-autoconf-3071700/sqlite3.c
---- sqlite-autoconf-3071700.orig/sqlite3.c	2013-05-23 03:17:27.170459400 -0300
-+++ sqlite-autoconf-3071700/sqlite3.c	2013-05-23 03:25:01.839227616 -0300
-@@ -22931,13 +22931,6 @@
- */
- #if SQLITE_OS_UNIX              /* This file is used on unix only */
-
--/* Use posix_fallocate() if it is available
--*/
--#if !defined(HAVE_POSIX_FALLOCATE) \
--      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L)
--# define HAVE_POSIX_FALLOCATE 1
--#endif
--
- /*
- ** There are various methods for file locking used for concurrency
- ** control:
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 39a39d0..8eb6b2f 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3071700
+SQLITE_VERSION = 3071401
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2013
+SQLITE_SITE = http://www.sqlite.org
 SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
