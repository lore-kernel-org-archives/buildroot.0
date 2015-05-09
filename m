From: Florent Valette <florent.valette@gmail.com>
Date: Sat,  9 May 2015 18:22:24 +0200
Subject: [Buildroot] [PATCH 1/1] flashrom: Bump to version 0.9.8
Message-ID: <1431188544-20933-1-git-send-email-florent.valette@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add libusb and libftdi depedencies because new flashrom version
support usb-spi device such as pickit2 and ftdi usb-spi.

Signed-off-by: Florent Valette <florent.valette@gmail.com>
---
 package/flashrom/Config.in   | 3 +++
 package/flashrom/flashrom.mk | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 956500f..6ceacdf 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
 	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_LIBFTDI
 	# dmidecode is only a runtime dependency
 	select BR2_PACKAGE_DMIDECODE
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 70bbe30..525470a 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 0.9.7
+FLASHROM_VERSION = 0.9.8
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = http://download.flashrom.org/releases
-FLASHROM_DEPENDENCIES = pciutils
+FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi
 FLASHROM_LICENSE = GPLv2+
 FLASHROM_LICENSE_FILES = COPYING
 
-- 
1.9.1
