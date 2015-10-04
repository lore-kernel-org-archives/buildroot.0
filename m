From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:29:35 +0100
Subject: [Buildroot] [git commit] parted: add patch to fix musl build
Message-ID: <20151004172943.3CAE180818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=198f64f4671c80b012fedc8a4d7af6470fc190ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/e1b/e1b6de7b234f2ec154d772ee93e33275dff38f3e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/parted/0004-fix-includes-for-musl.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/parted/0004-fix-includes-for-musl.patch b/package/parted/0004-fix-includes-for-musl.patch
new file mode 100644
index 0000000..28c94ac
--- /dev/null
+++ b/package/parted/0004-fix-includes-for-musl.patch
@@ -0,0 +1,18 @@
+Include <fcntl.h> to get loff_t definition
+
+Patch borrowed from Alpine Linux at
+http://git.alpinelinux.org/cgit/aports/plain/main/parted/fix-includes.patch. Solves
+build with musl.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+--- parted-3.1.orig/libparted/fs/xfs/platform_defs.h
++++ parted-3.1/libparted/fs/xfs/platform_defs.h
+@@ -35,6 +35,7 @@
+ #define __XFS_PLATFORM_DEFS_H__
+ 
+ #include <stdio.h>
++#include <fcntl.h>
+ #include <stdarg.h>
+ #include <assert.h>
+ #include <endian.h>
