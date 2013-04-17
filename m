From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 21:54:36 +0200
Subject: [Buildroot] [git commit] quagga: bump to version 0.99.22.1
Message-ID: <20130417195410.693DC9B71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14dcb32ee45ccc8861365086d3d6c502458edae7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quagga/quagga.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

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
