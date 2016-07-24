From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:45:08 +0200
Subject: [Buildroot] [git commit] package/gdb: gdbserver: add missing header
Message-ID: <20160724134526.BB692817DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa0e26de0b48472251bc1333f33e1517270e3370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream patch for musl toolchains

Fixes:
http://autobuild.buildroot.net/results/564/56443134388ee6c4a13add10cc53eff6f47f244e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../7.10.1/0005-target.h-include-sys-types.h.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/gdb/7.10.1/0005-target.h-include-sys-types.h.patch b/package/gdb/7.10.1/0005-target.h-include-sys-types.h.patch
new file mode 100644
index 0000000..ba5419d
--- /dev/null
+++ b/package/gdb/7.10.1/0005-target.h-include-sys-types.h.patch
@@ -0,0 +1,30 @@
+From cd68d0ebe7748a5448c86eb021b717df6fe83f35 Mon Sep 17 00:00:00 2001
+From: Doug Evans <xdje42@gmail.com>
+Date: Sun, 22 Nov 2015 17:24:03 -0800
+Subject: [PATCH] target.h: #include <sys/types.h>.
+
+For musl.
+
+[Romain:
+  rebase on gdb 7.10.1 from upstream (7.11)
+  remove ChangeLog entry]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/target.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
+index 9a40867..6af043c 100644
+--- a/gdb/gdbserver/target.h
++++ b/gdb/gdbserver/target.h
+@@ -21,6 +21,7 @@
+ #ifndef TARGET_H
+ #define TARGET_H
+ 
++#include <sys/types.h> /* for mode_t */
+ #include "target/target.h"
+ #include "target/resume.h"
+ #include "target/wait.h"
+-- 
+2.5.5
+
