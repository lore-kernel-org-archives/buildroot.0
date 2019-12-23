From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:45:43 +0100
Subject: [Buildroot] [git commit] package/lftp: bump to version 4.9.0
Message-ID: <20191223223636.5B6EE8E151@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d8c067b2ea3dd77771696888dc04b25b6d2204d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../lftp/0002-fix-gcc-6-conflicts-signbit.patch    | 57 ----------------------
 package/lftp/lftp.hash                             |  6 +--
 package/lftp/lftp.mk                               |  2 +-
 3 files changed, 4 insertions(+), 61 deletions(-)

diff --git a/package/lftp/0002-fix-gcc-6-conflicts-signbit.patch b/package/lftp/0002-fix-gcc-6-conflicts-signbit.patch
deleted file mode 100644
index e906c7ac80..0000000000
--- a/package/lftp/0002-fix-gcc-6-conflicts-signbit.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Use <cmath> instead of <math.h> to fix gcc 6.x build
-
-This patch fixes the following build issue:
-
-../lib/math.h:2577:1: error: ???int signbit(float)??? conflicts with a previous declaration
-
-that occurs with gcc 6.x.
-
-Patch taken from
-https://raw.githubusercontent.com/openembedded/meta-openembedded/master/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
---- lftp-4.6.3a/src/NetAccess.cc.orig	2016-06-18 10:25:51.063358981 -0400
-+++ lftp-4.6.3a/src/NetAccess.cc	2016-06-18 10:26:04.143359209 -0400
-@@ -21,7 +21,7 @@
- 
- #include <errno.h>
- #include <assert.h>
--#include <math.h>
-+#include <cmath>
- #include <sys/types.h>
- 
- #include "NetAccess.h"
---- lftp-4.6.3a/src/Speedometer.cc.orig	2016-06-18 10:24:58.895358073 -0400
-+++ lftp-4.6.3a/src/Speedometer.cc	2016-06-18 10:25:10.879358281 -0400
-@@ -18,7 +18,7 @@
-  */
- 
- #include <config.h>
--#include <math.h>
-+#include <cmath>
- #include <stdlib.h>
- #include "Speedometer.h"
- #include "misc.h"
---- lftp-4.6.3a/src/FileCopy.cc.orig	2016-06-18 10:24:15.939357325 -0400
-+++ lftp-4.6.3a/src/FileCopy.cc	2016-06-18 10:24:24.583357475 -0400
-@@ -36,7 +36,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--#include <math.h>
-+#include <cmath>
- #include <stddef.h>
- #include "FileCopy.h"
- #include "url.h"
---- lftp-4.6.3a/src/ResMgr.cc.orig	2016-06-18 10:23:31.387356549 -0400
-+++ lftp-4.6.3a/src/ResMgr.cc	2016-06-18 10:23:41.771356729 -0400
-@@ -23,7 +23,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <stdlib.h>
--#include <math.h>
-+#include <cmath>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <errno.h>
diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 64aba12b24..3efa8bfff1 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,7 +1,7 @@
-# From http://lftp.yar.ru/ftp/lftp-4.8.4.md5sum
-md5 b75c43797e817529d486be640232d708  lftp-4.8.4.tar.xz
+# From http://lftp.yar.ru/ftp/lftp-4.9.0.md5sum
+md5 6e3268506895a446a6c83b6387534070  lftp-4.9.0.tar.xz
 # Locally calculated after checking gpg signature
-sha256 4ebc271e9e5cea84a683375a0f7e91086e5dac90c5d51bb3f169f75386107a62  lftp-4.8.4.tar.xz
+sha256 0b3b659e1969a31827a25861c01ccf71ac6d3f20ee256bdf6999d653e031a24e  lftp-4.9.0.tar.xz
 
 # Hash for license file:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index b8a2b24302..cb5785668e 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.8.4
+LFTP_VERSION = 4.9.0
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
