From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 09:14:36 +0100
Subject: [Buildroot] [PATCH 6/6] busybox: add upstream 1.16 fix
In-Reply-To: <cover.1267172039.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267172039.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1d7b6f65c633865b25c8603975f9aec88e4e1275.1267172039.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://bugs.busybox.net/show_bug.cgi?id=1177, available at
http://busybox.net/downloads/fixes-1.16.0/busybox-1.16.0-fsync.patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox-1.16.0-fsync.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.0-fsync.patch

diff --git a/package/busybox/busybox-1.16.0-fsync.patch b/package/busybox/busybox-1.16.0-fsync.patch
new file mode 100644
index 0000000..b0d73ee
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-fsync.patch
@@ -0,0 +1,13 @@
+diff -urpN busybox-1.16.0/coreutils/fsync.c busybox-1.16.0-fsync/coreutils/fsync.c
+--- busybox-1.16.0/coreutils/fsync.c	2010-01-25 01:59:38.000000000 +0100
++++ busybox-1.16.0-fsync/coreutils/fsync.c	2010-02-26 08:24:59.000000000 +0100
+@@ -7,6 +7,9 @@
+  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
+  */
+ #include "libbb.h"
++#ifndef O_NOATIME
++# define O_NOATIME 0
++#endif
+ 
+ /* This is a NOFORK applet. Be very careful! */
+ 
-- 
1.6.3.3
