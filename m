From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 19 Apr 2019 17:15:54 -0400
Subject: [Buildroot] [PATCH 03/10] package/gstreamer1/gstreamer1: bump to
 version 1.16.0
In-Reply-To: <20190419211601.53431-1-aduskett@gmail.com>
References: <20190419211601.53431-1-aduskett@gmail.com>
Message-ID: <20190419211601.53431-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also remove upstreamed patch 0001-gstconfig.h.in-initial-RISC-V-support.patch.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...stconfig.h.in-initial-RISC-V-support.patch | 34 -------------------
 package/gstreamer1/gstreamer1/gstreamer1.hash |  4 +--
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/gstreamer1/gstreamer1/0001-gstconfig.h.in-initial-RISC-V-support.patch

diff --git a/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-initial-RISC-V-support.patch b/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-initial-RISC-V-support.patch
deleted file mode 100644
index 689346a3e8..0000000000
--- a/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-initial-RISC-V-support.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 58982c0d28f1eb385319307ee47bd6522c812f22 Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Sun, 15 Apr 2018 00:49:55 +0200
-Subject: [PATCH] gstconfig.h.in: initial RISC-V support
-
-RISC-V supports unaligned accesses, but these might run extremely slowly
-depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS
-to 0 on this architecture.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=795271
-
-Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/commit/8a156d1725ecd03f2e8cdc8874e081dda2d3b43d
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- gst/gstconfig.h.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
-index 6351c04da..33dfed1f6 100644
---- a/gst/gstconfig.h.in
-+++ b/gst/gstconfig.h.in
-@@ -104,7 +104,7 @@
-  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
-  * https://software.intel.com/en-us/node/583402
-  */
--#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__) || defined(__e2k__)
-+#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__) || defined(__e2k__) || defined(__riscv)
- #  define GST_HAVE_UNALIGNED_ACCESS 0
- #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
- #  define GST_HAVE_UNALIGNED_ACCESS 1
--- 
-2.19.1
-
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 204bb74fd3..588526c5c2 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.4.tar.xz.sha256sum
-sha256 f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0efa497e7920afa985ffc7 gstreamer-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.16.0.tar.xz.sha256sum
+sha256 0e8e2f7118be437cba879353970cf83c2acced825ecb9275ba05d9186ef07c00 gstreamer-1.16.0.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 76a74a0806..3378232c10 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.14.4
+GSTREAMER1_VERSION = 1.16.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.20.1
