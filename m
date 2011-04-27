From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 27 Apr 2011 10:26:39 +0200
Subject: [Buildroot] [PATCH] hostapd: add support for libnl-2.0
Message-ID: <4DB7D33F.2030309@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/hostapd/hostapd.mk
===================================================================
--- a/package/hostapd/hostapd.mk	2011-04-27 00:06:51.406285279 -0700
+++ b/package/hostapd/hostapd.mk	2011-04-27 00:09:51.622284999 -0700
@@ -10,6 +10,10 @@
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
 
+define HOSTAPD_LIBNL_CONFIG
+	echo "CONFIG_LIBNL20=y" >>$(HOSTAPD_CONFIG)
+endef
+
 define HOSTAPD_CRYPTO_CONFIG
 	echo "CONFIG_CRYPTO=internal" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(HOSTAPD_CONFIG)
@@ -82,6 +86,7 @@
 	$(HOSTAPD_RADIUS_IPV6_CONFIG)
 	$(HOSTAPD_EAP_CONFIG)
 	$(HOSTAPD_WPS_CONFIG)
+	$(HOSTAPD_LIBNL_CONFIG)
 endef
 
 define HOSTAPD_INSTALL_TARGET_CMDS
