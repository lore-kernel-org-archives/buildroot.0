From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:50:29 +0100
Subject: [Buildroot] [git commit] quagga: fix BR2_PACKAGE_QUAGGA_TCP_ZEBRA
Message-ID: <20181201204712.3FB6389069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0bcc6311eacecc60adeb2a65afc8c98884655ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 0.99.21 and commit
b20c77321fa87f880ead2f27ecf19fd7c4f436da, BR2_PACKAGE_QUAGGA_TCP_ZEBRA
has been wrongly rename into BR2_PACKAGE_QUAGGA_TCP_ZERBRA

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quagga/quagga.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index b2b4e2a1f7..8c2b80631b 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -45,7 +45,7 @@ QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_PIMD),--enable-pimd,--disable-pimd
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),--enable-watchquagga,--disable-watchquagga)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-isisd)
 QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
-QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--disable-tcp-zebra)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZEBRA),--enable-tcp-zebra,--disable-tcp-zebra)
 
 define QUAGGA_USERS
 	quagga -1 quagga -1 * - - - Quagga priv drop user
