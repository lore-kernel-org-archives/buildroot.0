From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2013 14:11:47 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.8.0.2
Message-ID: <20131003200657.C8F6D9B91D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdabe4cbcc1ed58a5db30e3aa01c0ff697d68b8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop sqlite-dont-force-posix-fallocate.patch because it is fixed upstream.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../sqlite/sqlite-dont-force-posix-fallocate.patch |   23 --------------------
 package/sqlite/sqlite.mk                           |    2 +-
 2 files changed, 1 insertions(+), 24 deletions(-)

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
index d474619..5fc1e9e 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3071700
+SQLITE_VERSION = 3080002
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2013
 SQLITE_LICENSE = Public domain
