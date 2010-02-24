From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:59:32 +0100
Subject: [Buildroot] [git commit master] netsnmp: use the autoconf built by
	Buildroot
Message-ID: <20100224220112.3E8F677798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1ab9bb250c026d4d07e31c2dce3839335b0c7aa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/netsnmp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index cfe9905..c589e25 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -58,7 +58,7 @@ endif
 
 $(NETSNMP_DIR)/.configured: $(NETSNMP_DIR)/.unpacked
 	(cd $(NETSNMP_DIR); rm -f config.cache; \
-		autoconf && \
+		$(AUTOCONF) && \
 		ac_cv_NETSNMP_CAN_USE_SYSCTL=yes \
 		$(NETSNMP_CONFIGURE_PERL_ENV) \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -130,7 +130,7 @@ endif
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/usr/include/net-snmp/agent/header_complex.h
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd $(TARGET_DIR)/etc/init.d/S59snmpd
 
-netsnmp: $(if $(BR2_PACKAGE_OPENSSL),openssl) $(TARGET_DIR)/usr/sbin/snmpd
+netsnmp: host-autoconf $(if $(BR2_PACKAGE_OPENSSL),openssl) $(TARGET_DIR)/usr/sbin/snmpd
 
 netsnmp-headers: $(TARGET_DIR)/usr/include/net-snmp/net-snmp-config.h
 	$(INSTALL) -d $(TARGET_DIR)/usr/include/net-snmp
-- 
1.6.3.3
