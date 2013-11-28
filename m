From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 28 Nov 2013 10:24:25 +0000
Subject: [Buildroot] [PATCH] connman: remove defunkt configuration options
Message-ID: <1385634265-16305-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

We are carrying support for a couple of configuration options which
are no longer present in connman. Specifically:
; threads: vestigial configuration option needed for defunkt WiMAX plugin
; ntpd: plugin no longer present in connman

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/connman/Config.in  | 8 --------
 package/connman/connman.mk | 4 +---
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 021e211..a6aa597 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -19,11 +19,6 @@ config BR2_PACKAGE_CONNMAN
 
 if BR2_PACKAGE_CONNMAN
 
-config BR2_PACKAGE_CONNMAN_THREADS
-	bool "enable threading support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	default y
-
 config BR2_PACKAGE_CONNMAN_ETHERNET
 	bool "enable Ethernet support"
 	default y
@@ -38,9 +33,6 @@ config BR2_PACKAGE_CONNMAN_BLUETOOTH
 config BR2_PACKAGE_CONNMAN_LOOPBACK
 	bool "enable loopback support"
 
-config BR2_PACKAGE_CONNMAN_NTPD
-	bool "enable ntpd support"
-
 config BR2_PACKAGE_CONNMAN_DEBUG
 	bool "enable compiling with debugging information"
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4a6bb78..7ee1417 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -12,13 +12,11 @@ CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPT += --localstatedir=/var \
-	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
 	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
-	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
-	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)
+	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)
 
 define CONNMAN_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
-- 
1.8.3.2
