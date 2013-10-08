From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  8 Oct 2013 09:11:55 +0200
Subject: [Buildroot] [PATCH] libsoc: bump to 0.4
Message-ID: <1381216315-14838-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

"Non-blocking GPIO Interrupts with callback mechanism" feature
requires pthreads.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsoc/Config.in |    4 ++++
 package/libsoc/libsoc.mk |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/libsoc/Config.in b/package/libsoc/Config.in
index 3e750bd..0f6336d 100644
--- a/package/libsoc/Config.in
+++ b/package/libsoc/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBSOC
 	bool "libsoc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libsoc is a C library for interfacing with common SoC
 	  peripherals through generic kernel interfaces
 
 	  https://github.com/jackmitch/libsoc
+
+comment "libsoc requires a toolchain with threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 509d8eb..79c7e90 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 356760dcb93b22d6c67c5232cde2ade8c968c932
+LIBSOC_VERSION = 0.4
 LIBSOC_SITE = http://github.com/jackmitch/libsoc/tarball/$(LIBSOC_VERSION)
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
-- 
1.7.7
