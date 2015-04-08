From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed,  8 Apr 2015 09:56:12 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/hplip: Un-deprecate and bump
	version to 3.15.2
In-Reply-To: <1428479774-29241-1-git-send-email-olivier.schonken@gmail.com>
References: <1428479774-29241-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1428479774-29241-2-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/hplip/Config.in  | 1 -
 package/hplip/hplip.hash | 2 +-
 package/hplip/hplip.mk   | 4 +++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index a8a5f69..780c69e 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HPLIP
 	bool "hplip"
 	# because of cups security issues
-	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
index fb7d4e7..a179b1d 100644
--- a/package/hplip/hplip.hash
+++ b/package/hplip/hplip.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  a8122cd824398ac6374154f86152e24fdf5c0100b5c1d6518e853308362e627d  hplip-3.13.10.tar.gz
+sha256  5f02eca743d85240db07ed2fc6551e1dce0dedc85ad4a0e90417e4d5b630f67c	hplip-3.15.2.tar.gz
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 2cdddca..2990e88 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HPLIP_VERSION = 3.13.10
+HPLIP_VERSION = 3.15.2
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg
@@ -29,6 +29,8 @@ HPLIP_CONF_OPTS = \
 	--with-sysroot=$(STAGING_DIR) \
 	--includedir=$(STAGING_DIR)/usr/include
 
+HPLIP_MAKE_OPTS += LDFLAGS+=-lpthread
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 HPLIP_CONF_OPTS += --enable-dbus-build
 HPLIP_DEPENDENCIES += dbus
-- 
1.9.1
