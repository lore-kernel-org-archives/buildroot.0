From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 11 Jan 2016 16:44:26 +0100
Subject: [Buildroot] [PATCH] skeleton: fix indentation of generated
	interfaces file
Message-ID: <1452527066-4914-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The generated $(TARGET_DIR)/etc/network/interfaces mixes spaces and
tabs. Fix by using tabs only.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/skeleton/skeleton.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index d640e24..6b5ab79 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -148,7 +148,7 @@ define SET_NETWORK_DHCP
 		echo ;                                               \
 		echo "auto $(NETWORK_DHCP_IFACE)";                   \
 		echo "iface $(NETWORK_DHCP_IFACE) inet dhcp";        \
-		echo "  pre-up /etc/network/nfs_check";              \
+		echo "	pre-up /etc/network/nfs_check";              \
 		echo "	wait-delay 15";                              \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 	$(INSTALL) -m 0755 -D $(SKELETON_PKGDIR)/nfs_check \
-- 
1.9.1
