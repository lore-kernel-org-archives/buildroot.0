From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 15:00:04 +0100
Subject: [Buildroot] [git commit] kexec: bump to 2.0.14
Message-ID: <20161223142516.363C181EC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b2c814aebdb782242ec2bbe20b24c71accd1af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002-arm-add-phys_to_virt.h-and-iomem.patch is now obsolete as
it's been properly fixed upstream now.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-arm-add-phys_to_virt.h-and-iomem.patch    | 35 ----------------------
 package/kexec/kexec.hash                           |  2 +-
 package/kexec/kexec.mk                             |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch b/package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch
deleted file mode 100644
index 748acbd..0000000
--- a/package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-arm: add iomem.h and phys_to_virt.h
-
-Fixes build for arm.
-
-This patch is equivalent to upstream commit 1574ff1aae4f3 (arm: include
-phys_to_virt.h and iomem.h in distribution) when applied to the tarball.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
----
-diff -Nuar kexec-tools-2.0.13-orig/kexec/arch/arm/iomem.h kexec-tools-2.0.13/kexec/arch/arm/iomem.h
---- kexec-tools-2.0.13-orig/kexec/arch/arm/iomem.h	1970-01-01 02:00:00.000000000 +0200
-+++ kexec-tools-2.0.13/kexec/arch/arm/iomem.h	2016-10-21 09:45:27.495689269 +0300
-@@ -0,0 +1,9 @@
-+#ifndef IOMEM_H
-+#define IOMEM_H
-+
-+#define SYSTEM_RAM		"System RAM\n"
-+#define SYSTEM_RAM_BOOT		"System RAM (boot alias)\n"
-+#define CRASH_KERNEL		"Crash kernel\n"
-+#define CRASH_KERNEL_BOOT	"Crash kernel (boot alias)\n"
-+
-+#endif
-diff -Nuar kexec-tools-2.0.13-orig/kexec/arch/arm/phys_to_virt.h kexec-tools-2.0.13/kexec/arch/arm/phys_to_virt.h
---- kexec-tools-2.0.13-orig/kexec/arch/arm/phys_to_virt.h	1970-01-01 02:00:00.000000000 +0200
-+++ kexec-tools-2.0.13/kexec/arch/arm/phys_to_virt.h	2016-10-21 09:45:27.495689269 +0300
-@@ -0,0 +1,8 @@
-+#ifndef PHYS_TO_VIRT_H
-+#define PHYS_TO_VIRT_H
-+
-+#include <stdint.h>
-+
-+extern uint64_t phys_offset;
-+
-+#endif
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 90a7ce9..9039dad 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256	874baf421171dbfca0084af2da71ccf5a67749dd2a27c3023da5f72460bae5cc kexec-tools-2.0.13.tar.xz
+sha256	ffb2e7e99d9d08754c6bc1922aed3c000094f318665d82a72ecc76c4ff1c0dc6 kexec-tools-2.0.14.tar.xz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 0a74369..0a8e9f0 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.13
+KEXEC_VERSION = 2.0.14
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
