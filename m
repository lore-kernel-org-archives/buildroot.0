From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:38 +0100
Subject: [Buildroot] [PATCH 06/51] busybox: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0ceaab1..d5a6a2d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -218,8 +218,11 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
 	fi
-	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
+endef
+
+define BUSYBOX_INSTALL_INIT_SYSV
+	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
-- 
2.1.0
