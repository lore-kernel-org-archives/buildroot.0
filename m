From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jan 2013 07:25:46 -0300
Subject: [Buildroot] [PATCH] pcsc-lite: requires mmu
Message-ID: <1359541546-32281-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/14400ae2c9e312729efa9a9026b5fdd487868c8a/

Also add license information while at it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ccid/Config.in         | 1 +
 package/pcsc-lite/Config.in    | 1 +
 package/pcsc-lite/pcsc-lite.mk | 5 ++++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index c9b77d1..c85a71c 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CCID
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_USE_MMU # pcsc-lite
 	help
 	  PC/SC driver for USB CCID smart card readers
 
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 621cc66..d6629d0 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PCSC_LITE
 	bool "pcsc-lite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Middleware to access smart card using SCard API (PC/SC).
 
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index d1d7691..e1def7c 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -2,12 +2,15 @@
 #
 # PCSC-Lite
 #
-# ########################################################
+#########################################################
+
 PCSC_LITE_VERSION = 1.8.6
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/3757
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
+PCSC_LITE_LICENSE = BSD-3c
+PCSC_LITE_LICENSE_FILES = COPYING
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
-- 
1.7.12.4
