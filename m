From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 23:20:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: fix musl build
Message-ID: <1454192444-26265-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inspired by
https://bug.tasktools.org/secure/attachment/10271/0001-Fix-build-with-musl-libc.patch

Fixes
http://autobuild.buildroot.net/results/603/603c4426c47220808305a416f3d60fec2d8c02a3/
http://autobuild.buildroot.net/results/c08/c08abddeb5f0d0d1adec63ab4390562e3cfe1087/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lirc-tools/0004-musl.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/lirc-tools/0004-musl.patch

diff --git a/package/lirc-tools/0004-musl.patch b/package/lirc-tools/0004-musl.patch
new file mode 100644
index 0000000..e5eddba
--- /dev/null
+++ b/package/lirc-tools/0004-musl.patch
@@ -0,0 +1,19 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr lirc-0.9.2.org/tools/lirc-lsremotes.c lirc-0.9.2/tools/lirc-lsremotes.c
+--- lirc-0.9.2.org/tools/lirc-lsremotes.c	2014-11-23 18:42:09.000000000 +0100
++++ lirc-0.9.2/tools/lirc-lsremotes.c	2016-01-30 23:17:54.365815328 +0100
+@@ -28,6 +28,11 @@
+ #include "lirc_private.h"
+ #include "lirc_client.h"
+ 
++/* fixes build with musl libc */
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
++
+ static int opt_silent = 0;
+ static int opt_dump = 0;
+ 
-- 
2.7.0.rc3
