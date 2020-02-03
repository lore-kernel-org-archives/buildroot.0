From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:43:49 +0100
Subject: [Buildroot] [git commit] package/systemd: use interface name for
 networkd config file
Message-ID: <20200203223304.A943789114@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ba81d0109feeaf19c44416fee92ae39588ecfcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By using the interface in the filename for the networkd config file,
we have a clear association between the config file and the interface
it applies to.

This is beneficical for systems that have multiple interfaces.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 791e770ca1..6e31a14ac3 100644
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
