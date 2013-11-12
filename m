From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2013 00:47:00 +0100
Subject: [Buildroot] [git commit] qt5base: fix posix_fallocate patch
Message-ID: <20131112234828.46CC99BC19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be930801a261930246fb7febea1b83eee9a661e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
	http://autobuild.buildroot.net/results/a07/a07c1825a5295a8343cd89f0901d9a74a764d804/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-detect-posix_fallocate-at-configure-time.patch |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch b/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
index b0011f6..51cea04 100644
--- a/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
+++ b/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
@@ -136,12 +136,11 @@ diff --git a/src/3rdparty/sqlite.pri b/src/3rdparty/sqlite.pri
 index 58d4ddd..072502c 100644
 --- a/src/3rdparty/sqlite.pri
 +++ b/src/3rdparty/sqlite.pri
-@@ -1,6 +1,7 @@
+@@ -1,5 +1,6 @@
  CONFIG(release, debug|release):DEFINES *= NDEBUG
  DEFINES += SQLITE_OMIT_LOAD_EXTENSION SQLITE_OMIT_COMPLETE SQLITE_ENABLE_FTS3 SQLITE_ENABLE_FTS3_PARENTHESIS SQLITE_ENABLE_RTREE
  !contains(CONFIG, largefile):DEFINES += SQLITE_DISABLE_LFS
 +contains(QT_CONFIG, posix_fallocate):DEFINES += HAVE_POSIX_FALLOCATE=1
- winrt: DEFINES += SQLITE_OS_WINRT
  INCLUDEPATH +=  $$PWD/sqlite
  SOURCES +=      $$PWD/sqlite/sqlite3.c
 diff --git a/src/3rdparty/sqlite/sqlite3.c b/src/3rdparty/sqlite/sqlite3.c
