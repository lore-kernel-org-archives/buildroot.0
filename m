From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Jul 2019 19:03:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/flashrom: bump to version 1.1
Message-ID: <20190717170350.28132-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...latform-Add-riscv-to-known-platforms.patch | 41 -------------------
 package/flashrom/flashrom.hash                |  4 +-
 package/flashrom/flashrom.mk                  |  4 +-
 3 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch

diff --git a/package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch b/package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
deleted file mode 100644
index 06eb9256e4..0000000000
--- a/package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From a9a03cc6ba71825bfae0d64e1888f33c77345bc3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Mar 2018 23:08:29 -0700
-Subject: [PATCH] platform: Add riscv to known platforms
-
-Change-Id: I724a99e2493fcbf71c2fc2d9f6a1ad607c737087
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-on: https://review.coreboot.org/25260
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
-Reviewed-by: David Hendricks <david.hendricks@gmail.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/flashrom/flashrom/commit/a9a03cc6ba71825bfae0d64e1888f33c77345bc3]
----
- platform.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/platform.h b/platform.h
-index e3b7674ae..65fe85881 100644
---- a/platform.h
-+++ b/platform.h
-@@ -69,6 +69,9 @@
- #elif defined (__m68k__)
- 	#define __FLASHROM_ARCH__ "m68k"
- 	#define IS_M68K 1
-+#elif defined (__riscv)
-+	#define __FLASHROM_ARCH__ "riscv"
-+	#define IS_RISCV 1
- #elif defined (__sh__)
- 	#define __FLASHROM_ARCH__ "sh"
- 	#define IS_SH 1
-@@ -77,7 +80,7 @@
- 	#define IS_S390 1
- #endif
- 
--#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_SH || IS_S390)
-+#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_RISCV || IS_SH || IS_S390)
- #error Unknown architecture
- #endif
- 
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 3a68e8acb7..6622758a55 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-1.0.tar.bz2.asc
-sha256 3702fa215ba5fb5af8e54c852d239899cfa1389194c1e51cb2a170c4dc9dee64  flashrom-1.0.tar.bz2
+# https://download.flashrom.org/releases/flashrom-v1.1.tar.bz2.asc
+sha256 aeada9c70c22421217c669356180c0deddd0b60876e63d2224e3260b90c14e19  flashrom-v1.1.tar.bz2
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 733ad7318d..6b9e6dde94 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.0
-FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
+FLASHROM_VERSION = 1.1
+FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
-- 
2.20.1
