From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Dec 2015 23:10:52 +0100
Subject: [Buildroot] [git commit] libsoc: bump to 0.7.1
Message-ID: <20151209221059.87AED81EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cd6f1775f680f15522cf2187bf9f101ce9a6b57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-spi-fix-build-against-MUSL-C-library.patch | 28 ----------------------
 package/libsoc/libsoc.mk                           |  2 +-
 2 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch b/package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch
deleted file mode 100644
index 7e8061b..0000000
--- a/package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 647a3af126943b2251c82340ab7c81706b2eb805 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Fri, 27 Nov 2015 10:24:12 +0100
-Subject: [PATCH] spi: fix build against MUSL C library
-
-Without <linux/ioctl.h> include compiler cannot find _IOC_SIZEBITS
-macro, when using MUSL C library.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- lib/spi.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/spi.c b/lib/spi.c
-index 8465f75..6d1f78a 100644
---- a/lib/spi.c
-+++ b/lib/spi.c
-@@ -6,6 +6,7 @@
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <linux/types.h>
-+#include <linux/ioctl.h>
- #include <linux/spi/spidev.h>
- 
- #include "libsoc_spi.h"
--- 
-2.1.4
-
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 99bea17..84e281f 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.6.4
+LIBSOC_VERSION = 0.7.1
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
