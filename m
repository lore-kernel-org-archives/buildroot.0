From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jan 2020 12:28:27 +0100
Subject: [Buildroot] [git commit] package/olsr: add netjson plugin
Message-ID: <20200113111827.BA994816A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39476fbd82b0dac43fec5e671171e4e6ad9a4860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add netjson plugin, available since version 0.9.5 and
https://github.com/OLSR/olsrd/commit/64c00288f8e87d314a723e20c2dd69f1165f1645

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/olsr/olsr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 766b1432c1..e643a0cfb3 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -9,7 +9,7 @@ OLSR_VERSION = $(OLSR_VERSION_MAJOR).6.1
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
-	mdns nameservice p2pd pgraph secure txtinfo watchdog
+	mdns nameservice netjson p2pd pgraph secure txtinfo watchdog
 # Doesn't really need quagga but not very useful without it
 OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
 OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
