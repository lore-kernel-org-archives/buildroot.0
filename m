From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Apr 2013 21:39:43 -0300
Subject: [Buildroot] [PATCH 2/2] quagga: bump to version 0.99.22.1
In-Reply-To: <1366072783-28319-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366072783-28319-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1366072783-28319-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/quagga.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index fb060ef..42f8506 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QUAGGA_VERSION = 0.99.21
+QUAGGA_VERSION = 0.99.22.1
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
@@ -25,12 +25,9 @@ QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--di
 QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),--enable-opaque-lsa,--disable-opaque-lsa)
 
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
+QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
 QUAGGA_CONF_OPT += --enable-snmp
 QUAGGA_DEPENDENCIES += netsnmp
-# SNMP support tries -lcrypto by default, disable it if we ain't got openssl
-ifneq ($(BR2_PACKAGE_OPENSSL),y)
-QUAGGA_CONF_OPT +=--without-crypto
-endif
 else
 QUAGGA_CONF_OPT +=--disable-snmp
 endif
-- 
1.8.1.5
