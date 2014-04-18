From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 10:36:58 +0200
Subject: [Buildroot] [git commit] qt5base: Remove feature test for
	posix_fallocate in sqlite code
Message-ID: <20140418194047.BF53D9C8F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a3861f23f8620c01542810f29aef18526845dee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's already checked by the build system more accurately.

Fixes:

  http://autobuild.buildroot.net/results/e3b/e3b26ee314880fdb50bb774a0539bfba04d9fbcf/

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...not-check-feature-macros-for-posix_falloc.patch |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch b/package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch
new file mode 100644
index 0000000..554f1cd
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch
@@ -0,0 +1,41 @@
+From 18eee84e9458bdcb244df4c5ad968c8d5ea1860a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
+Date: Fri, 18 Apr 2014 10:19:03 +0300
+Subject: [PATCH] sqlite3: Do not check feature macros for posix_fallocate()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Build system already checks for this function and defines
+HAVE_POSIX_FALLOCATE if it is available.
+
+Next releases of Qt will come with an updated sqlite3 which removes this
+check.
+
+Change-Id: I55e403aa01a7f054f9fe4773ce96dad399afce80
+Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
+---
+ src/3rdparty/sqlite/sqlite3.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/3rdparty/sqlite/sqlite3.c b/src/3rdparty/sqlite/sqlite3.c
+index 03fa649..1ae9be2 100644
+--- a/src/3rdparty/sqlite/sqlite3.c
++++ b/src/3rdparty/sqlite/sqlite3.c
+@@ -22935,13 +22935,6 @@ SQLITE_PRIVATE const char *sqlite3OpcodeName(int i){
+ */
+ #if SQLITE_OS_UNIX              /* This file is used on unix only */
+ 
+-/* Use posix_fallocate() if it is available
+-*/
+-#if !defined(HAVE_POSIX_FALLOCATE) \
+-      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L)
+-# define HAVE_POSIX_FALLOCATE 1
+-#endif
+-
+ /*
+ ** There are various methods for file locking used for concurrency
+ ** control:
+-- 
+1.9.1
+
