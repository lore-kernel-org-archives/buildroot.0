From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:45 -0400
Subject: [Buildroot] [PATCH 13/15] dhcp: move systemd service file to
	/usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-14-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/dhcp/dhcp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f01a5fa..85acfbf 100644
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
+	ln -sf /usr/lib/systemd/system/dhcpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
 
 	echo "d /var/lib/dhcp 0755 - - - -" > \
-- 
2.1.0
