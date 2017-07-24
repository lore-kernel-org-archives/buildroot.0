From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jul 2017 20:40:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump version to 2.0.15
Message-ID: <20170724184016.21993-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:

0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=2f6f6d6fef7872647cacc6741ac35ac2b4df7ed5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     | 38 ----------------------
 package/kexec/kexec.hash                           |  2 +-
 package/kexec/kexec.mk                             |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch

diff --git a/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch b/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
deleted file mode 100644
index adaac2f6e..000000000
--- a/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Fix musl build
-
-Downloaded from http://patchwork.openembedded.org/patch/112685/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From d811875a41b4628040abaada3da29b7b9592e757 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Jan 2016 17:16:16 -0800
-Subject: [PATCH] vmcore-dmesg: Define _GNU_SOURCE
-
-loff_t is guarded with _GNU_SOURCE on some C library implementations
-e.g. musl since this type is not defined by POSIX. Define _GNU_SOURCE to
-include this define, it should help compiling on musl while nothing
-changes for glibc based systems since there _GNU_SOURCE is already
-defined
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- vmcore-dmesg/vmcore-dmesg.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
-index 0364636..a8f56df 100644
---- a/vmcore-dmesg/vmcore-dmesg.c
-+++ b/vmcore-dmesg/vmcore-dmesg.c
-@@ -1,4 +1,5 @@
- #define _XOPEN_SOURCE 600
-+#define _GNU_SOURCE
- #define _LARGEFILE_SOURCE 1
- #define _FILE_OFFSET_BITS 64
- #include <endian.h>
--- 
-2.7.0
-
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 9039dad48..0e39e7cff 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256	ffb2e7e99d9d08754c6bc1922aed3c000094f318665d82a72ecc76c4ff1c0dc6 kexec-tools-2.0.14.tar.xz
+sha256 899b7b861431eb51886d0c12866e91b036228244d35a5fb04762dd1a3c0194e7  kexec-tools-2.0.15.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index dd67eab0c..79c4b7362 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.14
+KEXEC_VERSION = 2.0.15
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.11.0
