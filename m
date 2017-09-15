From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Sep 2017 15:34:59 +0300
Subject: [Buildroot] [PATCH v2] zstd: bump to version 1.3.1
Message-ID: <a57c274e4f72fa84371c8255801482d31983fcd5.1505478899.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In this release zstd added the GPLv2 license and removed the PATENTS
clause (upstream commit 4f73b3b55d83b).

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Remove the PATENTS hash, update commit log
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 60641aa8ab6c..7fa5f7bf6ada 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256 0fdba643b438b7cbce700dcc0e7b3e3da6d829088c63757a5984930e2f70b348 zstd-v1.3.0.tar.gz
+sha256 312fb9dc75668addbc9c8f33c7fa198b0fc965c576386b8451397e06256eadc6 zstd-v1.3.1.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
-sha256 3a508245dd3c486bb9d78a8269091322359443ea54612c3648327a0b3512f23f PATENTS
+sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505 COPYING
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index cad80684f307..8ef6774ed8c0 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ZSTD_VERSION = v1.3.0
+ZSTD_VERSION = v1.3.1
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
-ZSTD_LICENSE = BSD-3-Clause
-ZSTD_LICENSE_FILES = LICENSE PATENTS
+ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
+ZSTD_LICENSE_FILES = LICENSE COPYING PATENTS
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
-- 
2.14.1
