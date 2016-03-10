From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 15:32:25 +0100
Subject: [Buildroot] [PATCH 1/2] fio: bump to version 2.7
Message-ID: <1457620346-18948-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch 0001-compile-fix-for-linux-header-changes.patch is removed
as it was a backport from an upstream patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-compile-fix-for-linux-header-changes.patch | 42 ----------------------
 package/fio/fio.mk                                 |  2 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 package/fio/0001-compile-fix-for-linux-header-changes.patch

diff --git a/package/fio/0001-compile-fix-for-linux-header-changes.patch b/package/fio/0001-compile-fix-for-linux-header-changes.patch
deleted file mode 100644
index 4a37e9d..0000000
--- a/package/fio/0001-compile-fix-for-linux-header-changes.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d7bb6180f831091c468e5aa749b142efd5eddda4 Mon Sep 17 00:00:00 2001
-From: "Robin H. Johnson" <robbat2@gentoo.org>
-Date: Wed, 3 Feb 2016 08:32:19 -0800
-Subject: [PATCH] libmtd: compile fix for linux header changes.
-
-In the Linux kernel source, mtd/mtd-user.h had a change
-'mtd: mtd-user: remove stdint.h include'
-(137d36af4a53858b8db7ca83c8480247118b8bdf)
-
-This causes the uint8_t/uint64_t types to be undefined in libmtd.h
-now, as they were implicitly coming from it before.
-
-Import stdint.h explicitly into libmtd.h to resolve this.
-
-X-URL: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=137d36af4a53858b8db7ca83c8480247118b8bdf
-Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>
----
-Patch downloaded from upstream repo:
-http://git.kernel.dk/?p=fio.git;a=patch;h=d7bb6180f831091c468e5aa749b142efd5eddda4
-
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
- oslib/libmtd.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/oslib/libmtd.h b/oslib/libmtd.h
-index 3625de5..b5fd3f3 100644
---- a/oslib/libmtd.h
-+++ b/oslib/libmtd.h
-@@ -29,6 +29,9 @@
- extern "C" {
- #endif
- 
-+// Needed for uint8_t, uint64_t
-+#include <stdint.h>
-+
- /* Maximum MTD device name length */
- #define MTD_NAME_MAX 127
- /* Maximum MTD device type string length */
--- 
-2.5.0
-
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 08fef5f..acebb6f 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = fio-2.6
+FIO_VERSION = fio-2.7
 FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPLv2 + special obligations
 FIO_LICENSE_FILES = COPYING
-- 
2.6.4
