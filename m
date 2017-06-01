From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:19:30 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/dhcp: create
	tmpfiles.d directory
Message-ID: <20170601144623.816578296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=664322444df630d07cd943f567a2eb6e3561232d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

dhcp.mk tries to create dhcp.conf in a non-existant directory.

Fixes:
http://autobuild.buildroot.net/results/40e/40e48f74b586ce380766cf31473932e43090671e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6ddab6c28ec1cae2718928505f96705cf8e08e83)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
