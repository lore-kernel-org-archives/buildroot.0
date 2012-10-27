From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 27 Oct 2012 18:39:02 -0400
Subject: [Buildroot] [PATCH] liblog4c-localtime: fix underquoted path bug.
Message-ID: <1351377542-1739-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the autobuilder bug that shows up during the
libmbus build.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 .../liblog4c-localtime-fix-underquoted-path.patch  |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/liblog4c-localtime/liblog4c-localtime-fix-underquoted-path.patch

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
-- 
1.7.9.5
