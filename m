From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  7 Jan 2014 11:29:19 +0100
Subject: [Buildroot] [PATCH 1/3] dhcpcd: install dhcpcd as /usr/sbin/dhcpcd.
In-Reply-To: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1389090561-32196-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU/Linux distributions usually install dhcpcd in /usr/sbin.
NetworkManager will look for it in this directory.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/dhcpcd/dhcpcd.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 8037706..01ced3a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -32,7 +32,7 @@ endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
-		$(TARGET_DIR)/usr/bin/dhcpcd
+		$(TARGET_DIR)/usr/sbin/dhcpcd
 	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
 		$(TARGET_DIR)/etc/dhcpcd.conf
 	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
-- 
1.7.9.5
