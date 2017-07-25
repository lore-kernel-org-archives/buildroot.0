From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:53:26 +0200
Subject: [Buildroot] [git commit] package/kexec: bump version to 2.0.15
Message-ID: <20170725194919.71C297FEE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c37d2631987d7b05dc040aee6406f893fa9d30e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:

0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=2f6f6d6fef7872647cacc6741ac35ac2b4df7ed5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     | 38 ----------------------
 package/kexec/kexec.hash                           |  2 +-
 package/kexec/kexec.mk                             |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch b/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
deleted file mode 100644
index adaac2f..0000000
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
index 9039dad..0e39e7c 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256	ffb2e7e99d9d08754c6bc1922aed3c000094f318665d82a72ecc76c4ff1c0dc6 kexec-tools-2.0.14.tar.xz
+sha256 899b7b861431eb51886d0c12866e91b036228244d35a5fb04762dd1a3c0194e7  kexec-tools-2.0.15.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index dd67eab..79c4b73 100644
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
