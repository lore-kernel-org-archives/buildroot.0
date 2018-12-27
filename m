From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Dec 2018 12:13:48 +0200
Subject: [Buildroot] [PATCH 3/3] lm-sensors: bump to version 3.5.0
In-Reply-To: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
References: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
Message-ID: <8335e1ae2ac2229a63c313e8bd085f385bfc2add.1545905628.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Download site is now at github.

Drop upstream musl fix patch.

Add license files hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../lm-sensors/0003-musl-fix-includes.patch   | 100 ------------------
 package/lm-sensors/lm-sensors.hash            |   4 +-
 package/lm-sensors/lm-sensors.mk              |   5 +-
 3 files changed, 5 insertions(+), 104 deletions(-)
 delete mode 100644 package/lm-sensors/0003-musl-fix-includes.patch

diff --git a/package/lm-sensors/0003-musl-fix-includes.patch b/package/lm-sensors/0003-musl-fix-includes.patch
deleted file mode 100644
index 69325abce046..000000000000
--- a/package/lm-sensors/0003-musl-fix-includes.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 6d85773537c9f277ed342f57500f784ccb2c4a3e Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Sun, 30 Aug 2015 22:26:39 +0100
-Subject: [PATCH 1/1] fix compilation under musl
-
-This patch removes conditional compilation elements that are designed to
-support glibc versions earlier than 2.0, which were causing the build
-to fail under musl.
-
-Based on the patch found here :
-
-http://git.alpinelinux.org/cgit/aports/plain/main/lm_sensors/musl-fix-includes.patch?id=fece1d19448dbd3a56fd8ac70443116187141848
-
-This patch has been accepted for integration upstream and should be
-present in the next release. See :
-
-http://www.lm-sensors.org/changeset/6314
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-Upstream-Status: pending
----
- prog/dump/isadump.c | 6 ------
- prog/dump/isaset.c  | 6 ------
- prog/dump/superio.c | 5 -----
- prog/dump/util.c    | 5 -----
- 4 files changed, 22 deletions(-)
-
-diff --git a/prog/dump/isadump.c b/prog/dump/isadump.c
-index e031e47..88e4c3b 100644
---- a/prog/dump/isadump.c
-+++ b/prog/dump/isadump.c
-@@ -36,13 +36,7 @@
- #include "util.h"
- #include "superio.h"
- 
--
--/* To keep glibc2 happy */
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- #ifdef __powerpc__
- unsigned long isa_io_base = 0; /* XXX for now */
-diff --git a/prog/dump/isaset.c b/prog/dump/isaset.c
-index 1d1bdad..a084c8a 100644
---- a/prog/dump/isaset.c
-+++ b/prog/dump/isaset.c
-@@ -32,13 +32,7 @@
- #include <string.h>
- #include "util.h"
- 
--
--/* To keep glibc2 happy */
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- #ifdef __powerpc__
- unsigned long isa_io_base = 0; /* XXX for now */
-diff --git a/prog/dump/superio.c b/prog/dump/superio.c
-index 1af7358..31e0d78 100644
---- a/prog/dump/superio.c
-+++ b/prog/dump/superio.c
-@@ -20,12 +20,7 @@
- */
- 
- #include <stdlib.h>
--
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- #include "superio.h"
- 
-diff --git a/prog/dump/util.c b/prog/dump/util.c
-index 676c339..d8b0927 100644
---- a/prog/dump/util.c
-+++ b/prog/dump/util.c
-@@ -11,12 +11,7 @@
- #include <stdio.h>
- #include "util.h"
- 
--/* To keep glibc2 happy */
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 0
- #include <sys/io.h>
--#else
--#include <asm/io.h>
--#endif
- 
- /* Return 1 if we should continue, 0 if we should abort */
- int user_ack(int def)
--- 
-2.4.3
-
diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index eeaa633f461f..40728252b49a 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f	lm-sensors_3.4.0.orig.tar.bz2
+sha256	f671c1d63a4cd8581b3a4a775fd7864a740b15ad046fe92038bcff5c5134d7e0	lm-sensors-V3-5-0.tar.gz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 778a355b0f7a..cebfcdf42765 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3.4.0
-LM_SENSORS_SOURCE = lm-sensors_$(LM_SENSORS_VERSION).orig.tar.bz2
-LM_SENSORS_SITE = http://snapshot.debian.org/archive/debian/20170208T211941Z/pool/main/l/lm-sensors
+LM_SENSORS_VERSION = V3-5-0
+LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,$(LM_SENSORS_VERSION))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
-- 
2.19.2
