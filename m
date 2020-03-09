From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun,  8 Mar 2020 23:50:01 -0300
Subject: [Buildroot] [PATCH 1/3] package/ifupdown-scripts: always install
 /etc/network/nfs_check
In-Reply-To: <20200309025003.26466-1-unixmania@gmail.com>
References: <20200309025003.26466-1-unixmania@gmail.com>
Message-ID: <20200309025003.26466-2-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The script is minuscle and can be useful to configure an interface via
DHCP at run-time.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index abb4575777..d387c530f1 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -25,13 +25,12 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "  wait-delay 15"; \
 		echo "  hostname \$$(hostname)"; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
-	$(INSTALL) -m 0755 -D $(IFUPDOWN_SCRIPTS_PKGDIR)/nfs_check \
-		$(TARGET_DIR)/etc/network/nfs_check
 endef
 endif
 
 define IFUPDOWN_SCRIPTS_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/etc/network
+	$(INSTALL) -m 0755 -D $(IFUPDOWN_SCRIPTS_PKGDIR)/nfs_check \
+		$(TARGET_DIR)/etc/network/nfs_check
 	$(call SYSTEM_RSYNC,$(IFUPDOWN_SCRIPTS_PKGDIR)/network,$(TARGET_DIR)/etc/network)
 	$(IFUPDOWN_SCRIPTS_LOCALHOST)
 	$(IFUPDOWN_SCRIPTS_DHCP)
-- 
2.18.2
