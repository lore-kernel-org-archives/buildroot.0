From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:40:00 +0100
Subject: [Buildroot] [git commit] dhcp: move systemd service file to /usr/lib
Message-ID: <20150320194323.92D018181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b054815ee5fd023d7123f35633688eb56c9514d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f01a5fa..e6465ed 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -78,11 +78,11 @@ endef
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
 define DHCP_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
-		$(TARGET_DIR)/lib/systemd/system/dhcpd.service
+		$(TARGET_DIR)/usr/lib/systemd/system/dhcpd.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -sf ../../../../lib/systemd/system/dhcpd.service \
+	ln -sf ../../../../usr/lib/systemd/system/dhcpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
 
 	echo "d /var/lib/dhcp 0755 - - - -" > \
