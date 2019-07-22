From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Jul 2019 17:54:01 -0500
Subject: [Buildroot] [PATCH] package/mtd: bump to 2.1.1
Message-ID: <20190722225401.2625-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removes 0001-mkfs.ubifs-fix-build-without-openssl.patch which has been
merged upsteam as b5027be5f470830ac9543db3c52e076b13abd313.

Release Notes:
https://www.spinics.net/lists/linux-mtd/msg08093.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...mkfs.ubifs-fix-build-without-openssl.patch | 38 -------------------
 package/mtd/mtd.mk                            |  2 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch

diff --git a/package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch b/package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch
deleted file mode 100644
index 8633830806..0000000000
--- a/package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 451b6fd8f6b619ae75d283df02edd835c8e3c627 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 29 Mar 2019 13:29:41 +0300
-Subject: [PATCH] mkfs.ubifs: fix build without openssl
-
-Exclude openssl headers when WITH_CRYPTO is not defined.
-
-Fixes this build failure:
-
-In file included from ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:25:0:
-ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error: openssl/rand.h: No such file or directory
- #include <openssl/rand.h>
-          ^~~~~~~~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: http://lists.infradead.org/pipermail/linux-mtd/2019-March/088508.html
-
- ubifs-utils/mkfs.ubifs/mkfs.ubifs.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
-index aa032392155b..8f0186043079 100644
---- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
-+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
-@@ -46,7 +46,9 @@
- #include <uuid.h>
- #include <sys/file.h>
- 
-+#ifdef WITH_CRYPTO
- #include <openssl/rand.h>
-+#endif
- 
- #include <mtd/ubifs-media.h>
- 
--- 
-2.20.1
-
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 94c8b8b1da..0de14dbcba 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.1.0
+MTD_VERSION = 2.1.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
-- 
2.17.1
