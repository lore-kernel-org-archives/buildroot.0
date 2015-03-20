From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:04 -0400
Subject: [Buildroot] [PATCH v2 13/25] dhcp: move systemd service file to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-14-git-send-email-mike@mikebwilliams.com>
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
-- 
2.1.0
