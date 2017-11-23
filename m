From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:56:05 +0100
Subject: [Buildroot] [git commit] parted: convert patches to git formatting
Message-ID: <20171123215508.25A3881258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e456589d8a075974f41efd602b9620d9589db722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rch-linux.c-Compile-without-ENABLE_DEVICE.patch |  8 +++---
 .../0002-configure.ac-uclinux-is-also-linux.patch  |  4 +--
 ...-Include-fcntl.h-to-get-loff_t-definition.patch | 29 ++++++++++++++++++++++
 package/parted/0003-fix-includes-for-musl.patch    | 18 --------------
 4 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch b/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
index 5adc9be..1cf699b 100644
--- a/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
+++ b/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
@@ -1,4 +1,4 @@
-From 7e87ca3c531228d35e13e802d2622006138b104c Mon Sep 17 00:00:00 2001
+From 141c4309d7164dcd4e09d137fc075c1726fd8dbb Mon Sep 17 00:00:00 2001
 From: Felix Janda <felix.janda@posteo.de>
 Date: Sun, 3 May 2015 10:33:15 +0200
 Subject: [PATCH] libparted/arch/linux.c: Compile without ENABLE_DEVICE_MAPPER
@@ -10,7 +10,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  1 file changed, 17 insertions(+), 4 deletions(-)
 
 diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 90ab21d..f6141e4 100644
+index 0f18904..cf38c6f 100644
 --- a/libparted/arch/linux.c
 +++ b/libparted/arch/linux.c
 @@ -2304,6 +2304,7 @@ zasprintf (const char *format, ...)
@@ -57,7 +57,7 @@ index 90ab21d..f6141e4 100644
          return result;
  }
  
-@@ -2958,12 +2968,15 @@ _disk_sync_part_table (PedDisk* disk)
+@@ -2945,12 +2955,15 @@ _disk_sync_part_table (PedDisk* disk)
                                                 unsigned long long *length);
  
  
@@ -75,5 +75,5 @@ index 90ab21d..f6141e4 100644
                  remove_partition = _blkpg_remove_partition;
  #ifdef BLKPG_RESIZE_PARTITION
 -- 
-2.1.4
+2.14.2
 
diff --git a/package/parted/0002-configure.ac-uclinux-is-also-linux.patch b/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
index b2119bc..5a264ce 100644
--- a/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
+++ b/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
@@ -1,4 +1,4 @@
-From b3958317c5ee2940e7024bec2e7f288b5a6a26c3 Mon Sep 17 00:00:00 2001
+From 7697d9c54e489b32b82c01f17db04f8b51857e51 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Mon, 30 Jun 2014 10:09:04 -0300
 Subject: [PATCH] configure.ac: uclinux is also linux
@@ -29,5 +29,5 @@ index 436d0e2..50ad478 100644
  AC_SUBST([OS])
  
 -- 
-1.8.5.5
+2.14.2
 
diff --git a/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch b/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch
new file mode 100644
index 0000000..752938a
--- /dev/null
+++ b/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch
@@ -0,0 +1,29 @@
+From 2078c07d38ee7841b89ac8d81afc5e8bfcd4f703 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 8 Oct 2017 00:58:58 +0200
+Subject: [PATCH] Include <fcntl.h> to get loff_t definition
+
+Patch borrowed from Alpine Linux at
+http://git.alpinelinux.org/cgit/aports/plain/main/parted/fix-includes.patch. Solves
+build with musl.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libparted/fs/xfs/platform_defs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/fs/xfs/platform_defs.h b/libparted/fs/xfs/platform_defs.h
+index 2b55752..17023dc 100644
+--- a/libparted/fs/xfs/platform_defs.h
++++ b/libparted/fs/xfs/platform_defs.h
+@@ -35,6 +35,7 @@
+ #define __XFS_PLATFORM_DEFS_H__
+ 
+ #include <stdio.h>
++#include <fcntl.h>
+ #include <stdarg.h>
+ #include <assert.h>
+ #include <endian.h>
+-- 
+2.14.2
+
diff --git a/package/parted/0003-fix-includes-for-musl.patch b/package/parted/0003-fix-includes-for-musl.patch
deleted file mode 100644
index 28c94ac..0000000
--- a/package/parted/0003-fix-includes-for-musl.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Include <fcntl.h> to get loff_t definition
-
-Patch borrowed from Alpine Linux at
-http://git.alpinelinux.org/cgit/aports/plain/main/parted/fix-includes.patch. Solves
-build with musl.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
---- parted-3.1.orig/libparted/fs/xfs/platform_defs.h
-+++ parted-3.1/libparted/fs/xfs/platform_defs.h
-@@ -35,6 +35,7 @@
- #define __XFS_PLATFORM_DEFS_H__
- 
- #include <stdio.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <assert.h>
- #include <endian.h>
