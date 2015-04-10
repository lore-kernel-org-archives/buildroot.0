From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 22:18:56 +0200
Subject: [Buildroot] [git commit] package/libpciaccess: Fix compilation
	error with musl-based toolchain
Message-ID: <20150410201902.90B2481960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db0fc30960d65ddc9a8510e2c8a4f427a2636fa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpciaccess/0001-limits_h.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/libpciaccess/0001-limits_h.patch b/package/libpciaccess/0001-limits_h.patch
new file mode 100644
index 0000000..9afa203
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
