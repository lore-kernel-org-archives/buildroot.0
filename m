From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 17:08:14 +0200
Subject: [Buildroot] [git commit] libsoc: bump to 0.4
Message-ID: <20131008150944.7D66B9B930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09e59d73f588ff26a62787dc91e0a0bc810b39e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"Non-blocking GPIO Interrupts with callback mechanism" feature
requires pthreads.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
