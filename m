From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jan 2017 13:45:02 -0300
Subject: [Buildroot] [PATCH 1/9] gstreamer1: bump to version 1.10.3
Message-ID: <20170130164510.17184-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ed-access-support-for-unknown-architectur.patch | 37 ----------------------
 package/gstreamer1/gstreamer1/gstreamer1.hash      |  4 +--
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  2 +-
 3 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch

diff --git a/package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch b/package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch
deleted file mode 100644
index 06897fb..0000000
--- a/package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 20bbce5758abf3493f3d7dc10edd335701c3a02c Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 5 Dec 2016 20:54:55 +0100
-Subject: [PATCH] Fix unaligned access support for unknown architectures.
-
-Better be safe (assume no unaligned access) than sorry (bail out
-with error message at compile time).
-
-Fixes compile for xtensa and microblaze architectures.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- gst/gstconfig.h.in | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
-index c2e8361..3a17398 100644
---- a/gst/gstconfig.h.in
-+++ b/gst/gstconfig.h.in
-@@ -104,12 +104,10 @@
-  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
-  * https://software.intel.com/en-us/node/583402
-  */
--#if defined(__alpha__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__mips__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64)
--#  define GST_HAVE_UNALIGNED_ACCESS 0
--#elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
-+#if defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
- #  define GST_HAVE_UNALIGNED_ACCESS 1
- #else
--#  error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
-+#  define GST_HAVE_UNALIGNED_ACCESS 0
- #endif
- 
- /**
--- 
-2.11.0
-
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 3fd7c6b..f65061b 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.2.tar.xz.sha256sum
-sha256 150e8e81febac94c161d8141cde78a38038a8f56e8ec549f353da54994278d65  gstreamer-1.10.2.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.3.tar.xz.sha256sum
+sha256 85b9dc1b2991f224fa90d534ec57014896c479e061dc9fa1bc16ae17cbebb63d  gstreamer-1.10.3.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 6086e13..ac2c988 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.10.2
+GSTREAMER1_VERSION = 1.10.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.10.2
