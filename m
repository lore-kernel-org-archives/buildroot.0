From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Wed,  8 Jan 2020 11:44:39 +0100
Subject: [Buildroot] [PATCH] package/systemd: use interface for networkd
 config file
Message-ID: <20200108104439.7041-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

by using the interface in the filename for the networkd config
file, we have a clear association between the config file and
the interface it applies to.

this is benefitical for systems that have multiple interfaces.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 791e770..6e31a14 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -330,7 +330,7 @@ ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
 define SYSTEMD_INSTALL_NETWORK_CONFS
 	sed s/SYSTEMD_NETWORKD_DHCP_IFACE/$(SYSTEMD_NETWORKD_DHCP_IFACE)/ \
 		$(SYSTEMD_PKGDIR)/dhcp.network > \
-		$(TARGET_DIR)/etc/systemd/network/dhcp.network
+		$(TARGET_DIR)/etc/systemd/network/$(SYSTEMD_NETWORKD_DHCP_IFACE).network
 endef
 endif
 else
-- 
2.7.4
