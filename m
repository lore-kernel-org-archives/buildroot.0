From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 17:15:08 +0100
Subject: [Buildroot] [git commit] connman: remove defunkt configuration
	options
Message-ID: <20131201201520.8B1F29BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7324c8d1f928789fd9fabe182c7f0ad4d78cd7b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are carrying support for a couple of configuration options which
are no longer present in connman. Specifically:
; threads: vestigial configuration option needed for defunkt WiMAX plugin
; ntpd: plugin no longer present in connman

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in  |    8 --------
 package/connman/connman.mk |    2 --
 2 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 1cf93e2..0c381af 100644
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
@@ -42,9 +37,6 @@ config BR2_PACKAGE_CONNMAN_NEARD
 	bool "enable neard support"
 	select BR2_PACKAGE_NEARD
 
-config BR2_PACKAGE_CONNMAN_NTPD
-	bool "enable ntpd support"
-
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
 	select BR2_PACKAGE_OFONO
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index cf54abc..64c1f0e 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -12,14 +12,12 @@ CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPT += --localstatedir=/var \
-	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
 	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
-	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd) \
 	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono)
 
 CONNMAN_DEPENDENCIES += \
