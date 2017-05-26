From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 27 May 2017 00:13:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/dhcp: create tmpfiles.d directory
Message-ID: <20170526221348.19078-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhcp.mk try to create dhcp.conf in a non-existant directory.

Fixes:
http://autobuild.buildroot.net/results/40e/40e48f74b586ce380766cf31473932e43090671e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/dhcp/dhcp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 4d2cb06..45cae08 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -102,6 +102,7 @@ define DHCP_INSTALL_INIT_SYSTEMD
 	ln -sf ../../../../usr/lib/systemd/system/dhcpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
 
+	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
 	echo "d /var/lib/dhcp 0755 - - - -" > \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
 	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
-- 
2.9.4
