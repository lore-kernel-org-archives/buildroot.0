From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 21:29:22 +0100
Subject: [Buildroot] [git commit] package/ifupdown-scripts: always install
 /etc/network/nfs_check
Message-ID: <20200311201814.C45E390963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=560f5f09b51b4de5cf9cfa1e5979eed3cff6db24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The script is minuscle and can be useful to configure an interface via
DHCP at run-time.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
