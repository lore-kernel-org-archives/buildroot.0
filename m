From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Feb 2021 21:20:22 +0100
Subject: [Buildroot] [PATCH/next v1] package/ifupdown-scripts: send udhcpc
 to background in case lease is not obtained
Message-ID: <20210216202022.27264-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add the 'udhcpc_opts -b' option to /etc/network/interfaces for the
  system dhcp configured interface. With this option ('-b: background if
  lease is not obtained') the udhcpc keeps running in case the initial
  dhcp requests are not answered immediately.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..d3135b18b6 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -28,6 +28,7 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "  pre-up /etc/network/nfs_check"; \
 		echo "  wait-delay 15"; \
 		echo "  hostname \$$(hostname)"; \
+		echo "  udhcpc_opts -b"; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
 define IFUPDOWN_SCRIPTS_DHCP_OPENRC
-- 
2.30.0
