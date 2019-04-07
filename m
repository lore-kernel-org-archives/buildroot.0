From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Apr 2019 21:59:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnfs: bump version to 4.0.0
Message-ID: <20190407195940.5655-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-libnfs.c-include-time.h-in-libnfs.c.patch | 35 -------------------
 package/libnfs/libnfs.hash                    |  2 +-
 package/libnfs/libnfs.mk                      |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch

diff --git a/package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch b/package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch
deleted file mode 100644
index 34e584017e..0000000000
--- a/package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b56bd3d99f67a3273fec3c0c5d9560413465a1db Mon Sep 17 00:00:00 2001
-From: Anna Lyons <Anna.Lyons@data61.csiro.au>
-Date: Thu, 12 Jul 2018 17:45:23 +1000
-Subject: [PATCH] libnfs.c: include <time.h> in libnfs.c
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-time() is used in this file, which is from time.h. Fixes a warning.
-
-Note, that building with musl breaks otherwise, as it is more strict regarding
-missing header inclusions.
-
-Backported from: 794a29f01f8e5961adc5c79d5ba5ac1062877e6c
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- lib/libnfs.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/libnfs.c b/lib/libnfs.c
-index d89d84d..43c17b9 100755
---- a/lib/libnfs.c
-+++ b/lib/libnfs.c
-@@ -70,6 +70,7 @@
- #include <stdarg.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <time.h>
- #include "slist.h"
- #include "libnfs.h"
- #include "libnfs-raw.h"
--- 
-2.19.1
-
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index 0e4dc6fbc9..9cd2fd71c5 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 445d92c5fc55e4a5b115e358e60486cf8f87ee50e0103d46a02e7fb4618566a5  libnfs-libnfs-3.0.0.tar.gz
+sha256 6ee77e9fe220e2d3e3b1f53cfea04fb319828cc7dbb97dd9df09e46e901d797d  libnfs-libnfs-4.0.0.tar.gz
 sha256 edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256 d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 3a84e0aafa..5c8f66b011 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-3.0.0
+LIBNFS_VERSION = libnfs-4.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-- 
2.20.1
