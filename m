From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:10:31 +0200
Subject: [Buildroot] [git commit] package/mtd: bump to 2.1.1
Message-ID: <20190729070847.BE679821C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5097a0b028b97e72bf07a25c4bbe6de9d20b6579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removes 0001-mkfs.ubifs-fix-build-without-openssl.patch which has been
merged upsteam as b5027be5f470830ac9543db3c52e076b13abd313.

Release Notes:
https://www.spinics.net/lists/linux-mtd/msg08093.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-mkfs.ubifs-fix-build-without-openssl.patch | 38 ----------------------
 package/mtd/mtd.hash                               |  4 +--
 package/mtd/mtd.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)

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
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index e82b3522cb..2e23fbb819 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.2.tar.bz2.asc
-sha256	b4b995b06d93aee4125e8e44c05a1cae6eea545ca5a6e8a377405ee8aa454bd2	mtd-utils-2.1.0.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.1.tar.bz2.asc
+sha256	8d15e8b70f036d6af1a66011f8ca0e048e9675fa7983d33bea92c24313a232d2	mtd-utils-2.1.1.tar.bz2
 sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
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
