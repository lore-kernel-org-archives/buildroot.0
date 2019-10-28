From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:18:05 +0100
Subject: [Buildroot] [git commit] package/duma: fix build with latest glibc
Message-ID: <20191028221615.BA8C68B85D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1cf9d2302ba4930e11f2ddb1ee45f81f7879989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/c7de1a1d01edced2098a804ad87dcb67b5dc6832

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../duma/0004-Fix-build-with-latest-glibc.patch    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/duma/0004-Fix-build-with-latest-glibc.patch b/package/duma/0004-Fix-build-with-latest-glibc.patch
new file mode 100644
index 0000000000..2d73d7ae57
--- /dev/null
+++ b/package/duma/0004-Fix-build-with-latest-glibc.patch
@@ -0,0 +1,22 @@
+Fix build with latest glibc
+
+Fixes:
+ - http://autobuild.buildroot.net/results/c7de1a1d01edced2098a804ad87dcb67b5dc6832
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -durN duma_2_5_15.orig/print.c duma_2_5_15/print.c
+--- duma_2_5_15.orig/print.c	2019-10-28 10:21:14.080149620 +0100
++++ duma_2_5_15/print.c	2019-10-28 10:22:01.256151561 +0100
+@@ -326,9 +326,9 @@
+   if(DUMA_OUTPUT_FILE != NULL)
+   {
+ #if defined(WIN32) && !defined(__CYGWIN__)
+-    fd = _open(DUMA_OUTPUT_FILE, _O_APPEND|_O_CREAT|_O_WRONLY);
++    fd = _open(DUMA_OUTPUT_FILE, _O_APPEND|_O_CREAT|_O_WRONLY, 0600);
+ #else
+-    fd = open(DUMA_OUTPUT_FILE, O_APPEND|O_CREAT|O_WRONLY);
++    fd = open(DUMA_OUTPUT_FILE, O_APPEND|O_CREAT|O_WRONLY, 0600);
+ #endif
+     if ( fd >= 0 )
+     {
