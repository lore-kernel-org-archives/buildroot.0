From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:46 +0100
Subject: [Buildroot] [PATCH 14/51] input-event-daemon: use
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/input-event-daemon/input-event-daemon.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 534fe90..bceefc7 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -21,6 +21,9 @@ define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
 	[ -f $(TARGET_DIR)/etc/input-event-daemon.conf ] || \
 		$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
 			$(TARGET_DIR)/etc/input-event-daemon.conf
+endef
+
+define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S99input-event-daemon ] || \
 		$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
 			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
-- 
2.1.0
