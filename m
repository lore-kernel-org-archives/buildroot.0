From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 31 Dec 2018 11:15:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/udisks: Fix compilation issue with
 missing sys/sysmacros.h
Message-ID: <20181231091551.6335-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It fixes compilation error with undefined "minor", "major" and
"makedev" objects which caused by missing include of <sys/sysmacros.h>

These definitions were moved to <sys/sysmacros.h> in newer gibc.

Fixes: http://autobuild.buildroot.net/results/74a8d8c247cfc9c0024e749e1f1ac423c9e90855/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...tion-issue-with-missing-sys-sysmacros.h-i.patch | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch

diff --git a/package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch b/package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch
new file mode 100644
index 0000000000..9059a90df9
--- /dev/null
+++ b/package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch
@@ -0,0 +1,80 @@
+From d934b0fa5ce24a8fd1987b916e435ba991c2ef64 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim.kochan@petcube.com>
+Date: Mon, 31 Dec 2018 11:00:46 +0200
+Subject: [PATCH] Fix compilation issue with missing sys/sysmacros.h include
+
+Newer glibc moved linux dev definitions (major, minor, makedev) to
+<sys/sysmacros.h>
+
+Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
+---
+ src/daemon.c          | 1 +
+ src/device.c          | 1 +
+ src/mount-monitor.c   | 1 +
+ tools/udisks.c        | 1 +
+ tools/umount-udisks.c | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/src/daemon.c b/src/daemon.c
+index fafcf9a..4303a6d 100644
+--- a/src/daemon.c
++++ b/src/daemon.c
+@@ -45,6 +45,7 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <sys/utsname.h>
++#include <sys/sysmacros.h>
+ #include <net/if_arp.h>
+ #include <fcntl.h>
+ #include <signal.h>
+diff --git a/src/device.c b/src/device.c
+index 2ae7f38..20920df 100644
+--- a/src/device.c
++++ b/src/device.c
+@@ -33,6 +33,7 @@
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
++#include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <pwd.h>
+ #include <grp.h>
+diff --git a/src/mount-monitor.c b/src/mount-monitor.c
+index 573a69c..0cfa167 100644
+--- a/src/mount-monitor.c
++++ b/src/mount-monitor.c
+@@ -29,6 +29,7 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <mntent.h>
+ 
+ #include <glib.h>
+diff --git a/tools/udisks.c b/tools/udisks.c
+index 97e80d7..22a7d87 100644
+--- a/tools/udisks.c
++++ b/tools/udisks.c
+@@ -31,6 +31,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/wait.h>
++#include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <pwd.h>
+ #include <grp.h>
+diff --git a/tools/umount-udisks.c b/tools/umount-udisks.c
+index 2813fe0..d915660 100644
+--- a/tools/umount-udisks.c
++++ b/tools/umount-udisks.c
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <pwd.h>
+ #include <grp.h>
+-- 
+2.14.1
+
-- 
2.14.1
