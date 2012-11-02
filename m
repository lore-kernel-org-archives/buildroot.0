From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 21:02:28 +0100
Subject: [Buildroot] [git commit] liblog4c-localtime: fix underquoted path
	bug.
Message-ID: <20121102231429.D6132999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5671f9e6313842a1718c5e3d1de20c69ae544ecc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes the autobuilder bug that shows up during the
libmbus build.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../liblog4c-localtime-fix-underquoted-path.patch  |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/liblog4c-localtime/liblog4c-localtime-fix-underquoted-path.patch b/package/liblog4c-localtime/liblog4c-localtime-fix-underquoted-path.patch
new file mode 100644
index 0000000..8a74a5e
--- /dev/null
+++ b/package/liblog4c-localtime/liblog4c-localtime-fix-underquoted-path.patch
@@ -0,0 +1,16 @@
+Fix "underquoted definition of AM_PATH_LOG4C" warning.
+
+Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com> 
+
+diff -urN liblog4c-localtime-1.0/log4c.m4 liblog4c-localtime-1.0.orig/log4c.m4
+--- liblog4c-localtime-1.0/log4c.m4	2012-10-27 16:11:46.219894716 -0400
++++ liblog4c-localtime-1.0.orig/log4c.m4	2012-10-27 16:10:31.393336864 -0400
+@@ -4,7 +4,7 @@
+ dnl AM_PATH_LOG4C([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
+ dnl Test for LOG4C, and define LOG4C_CFLAGS and LOG4C_LIBS
+ dnl
+-AC_DEFUN(AM_PATH_LOG4C,
++AC_DEFUN([AM_PATH_LOG4C],
+ [dnl 
+ dnl Get the cflags and libraries from the log4c-config script
+ dnl
