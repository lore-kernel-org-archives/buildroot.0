From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 22:18:09 +0200
Subject: [Buildroot] [git commit] package/pixz: fix build with gcc 10
Message-ID: <20200831201229.5C4B281468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc44e46da00fdddbbd3f8c3950fa62f2d216bbfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/0c61743d4a022215317e57e35a00f0fa3d16ad62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixz/0001-fix-linkage.patch | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/pixz/0001-fix-linkage.patch b/package/pixz/0001-fix-linkage.patch
new file mode 100644
index 0000000000..712c280ec2
--- /dev/null
+++ b/package/pixz/0001-fix-linkage.patch
@@ -0,0 +1,41 @@
+From f385e7be8adb620ca7eb89f84abe4d1df94c1029 Mon Sep 17 00:00:00 2001
+From: Dave Vasilevsky <dave@vasilevsky.ca>
+Date: Sat, 25 Apr 2020 19:16:05 -0400
+Subject: [PATCH] fix linkage
+
+[Retrieved from:
+https://github.com/vasi/pixz/commit/f385e7be8adb620ca7eb89f84abe4d1df94c1029]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/common.c | 2 +-
+ src/pixz.h   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/common.c b/src/common.c
+index 59d3273..5938633 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -7,7 +7,7 @@
+ 
+ #pragma mark UTILS
+ 
+-FILE *gInFile = NULL;
++FILE *gInFile = NULL, *gOutFile = NULL;
+ lzma_stream gStream = LZMA_STREAM_INIT;
+ 
+ 
+diff --git a/src/pixz.h b/src/pixz.h
+index 0fa60f2..0939a9a 100644
+--- a/src/pixz.h
++++ b/src/pixz.h
+@@ -54,8 +54,8 @@ void pixz_read(bool verify, size_t nspecs, char **specs);
+ 
+ #pragma mark UTILS
+ 
+-FILE *gInFile, *gOutFile;
+-lzma_stream gStream;
++extern FILE *gInFile, *gOutFile;
++extern lzma_stream gStream;
+ 
+ extern lzma_index *gIndex;
+ 
