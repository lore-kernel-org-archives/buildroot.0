From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 23 Jan 2021 11:31:51 +0100
Subject: [Buildroot] [PATCH 2/6] package/mrouted: ensure multicast routing
 is enabled in kernel
In-Reply-To: <20210123103155.2599311-1-troglobit@gmail.com>
References: <20210123103155.2599311-1-troglobit@gmail.com>
Message-ID: <20210123103155.2599311-3-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/mrouted.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 6005066577..c9ac8f0441 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -18,4 +18,9 @@ define MROUTED_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
 endef
 
+define MROUTED_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MROUTE)
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1
