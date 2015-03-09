From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  9 Mar 2015 14:38:32 -0500
Subject: [Buildroot] [PATCH 1/1] quagga: option for vtysh
Message-ID: <1425929912-43526-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/quagga/Config.in | 5 +++++
 package/quagga/quagga.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index d8b10f8..0b9275a 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -82,6 +82,11 @@ config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
 	help
 	  Build and install watchquagga, a zebra/protocol daemon supervisor.
 
+config BR2_PACKAGE_QUAGGA_VTYSH
+	bool "Build vtysh"
+	help
+	  Build and install vtysh, a vty shell for Quagga.
+
 config BR2_PACKAGE_QUAGGA_SNMP
 	bool "SNMP support"
 	depends on BR2_USE_MMU # net-snmp
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 4a12ab3..e177841 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -27,6 +27,7 @@ QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-is
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--disable-tcp-zebra)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),--enable-opaque-lsa,--disable-opaque-lsa)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_VTYSH),--enable-vtysh,--disable-vtysh)
 
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
-- 
1.9.1
