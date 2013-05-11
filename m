From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:40:47 +0200
Subject: [Buildroot] [git commit branch/next] netsnmp: handle
	net-snmp-config script
Message-ID: <20130511204539.C00F29A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1deff2b17e30f4722c9e3a913d66ef403b816d6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/netsnmp.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index a6912e5..6a72da7 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -24,6 +24,8 @@ NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
 		--with-out-mib-modules="$(call qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
 		--with-out-transports="Unix"
 NETSNMP_MAKE = $(MAKE1)
+NETSNMP_CONFIG_SCRIPTS = net-snmp-config
+
 NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -81,9 +83,7 @@ define NETSNMP_UNINSTALL_TARGET_CMDS
 endef
 
 define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
+	$(SED) 	"s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/bin/net-snmp-config
 endef
