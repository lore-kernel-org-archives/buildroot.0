From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 22:06:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: Fix compilation error
	with musl-based toolchain
Message-ID: <1428696405-9969-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/0001-limits_h.patch |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/libpciaccess/0001-limits_h.patch

diff --git a/package/libpciaccess/0001-limits_h.patch b/package/libpciaccess/0001-limits_h.patch
new file mode 100644
index 0000000..e8cfee9
--- /dev/null
+++ b/package/libpciaccess/0001-limits_h.patch
@@ -0,0 +1,22 @@
+Fix compilation error with musl-based toolchain
+
+linux_sysfs.c:751:15: error: 'PATH_MAX' undeclared (first use in this function)
+     char name[PATH_MAX];
+
+Patch already sent upstream by Felix Janda
+http://lists.x.org/archives/xorg-devel/2014-December/044723.html
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libpciaccess-0.13.3.org/src/linux_sysfs.c libpciaccess-0.13.3/src/linux_sysfs.c
+--- libpciaccess-0.13.3.org/src/linux_sysfs.c	2015-02-04 00:59:14.000000000 +0100
++++ libpciaccess-0.13.3/src/linux_sysfs.c	2015-04-10 21:57:35.000000000 +0200
+@@ -44,6 +44,7 @@
+ #include <sys/mman.h>
+ #include <dirent.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ #if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
+ #include <sys/io.h>
-- 
1.7.10.4
