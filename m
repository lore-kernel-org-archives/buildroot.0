From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 Jan 2013 13:49:26 +0100
Subject: [Buildroot] [git commit] pcsc-lite: requires mmu
Message-ID: <20130131131402.2C9A39A1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94a05f966874defe4d678f110c11cb87bce1af4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/14400ae2c9e312729efa9a9026b5fdd487868c8a/

Also add license information while at it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccid/Config.in         |    1 +
 package/pcsc-lite/Config.in    |    1 +
 package/pcsc-lite/pcsc-lite.mk |    5 ++++-
 3 files changed, 6 insertions(+), 1 deletions(-)

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
