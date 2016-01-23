From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 15:53:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/monit: Fix musl build
Message-ID: <1453560802-8969-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/aa1/aa1c06324b066ba13d82bcb7afa452a4974f1254/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/monit/0002-musl.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/monit/0002-musl.patch

diff --git a/package/monit/0002-musl.patch b/package/monit/0002-musl.patch
new file mode 100644
index 0000000..ba8e4f0
--- /dev/null
+++ b/package/monit/0002-musl.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/monit/musl-fix.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- monit-5.6.old/src/process/sysdep_LINUX.c
++++ monit-5.6/src/process/sysdep_LINUX.c
+@@ -79,6 +79,10 @@
+ #include <glob.h>
+ #endif
+ 
++#ifndef GLOB_ONLYDIR
++#define GLOB_ONLYDIR 0
++#endif
++
+ #ifndef HZ
+ # define HZ sysconf(_SC_CLK_TCK)
+ #endif
-- 
2.7.0.rc3
