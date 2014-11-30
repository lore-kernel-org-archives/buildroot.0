From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:02 +0100
Subject: [Buildroot] [PATCHv3 14/74] input-event-daemon: use
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also makes the installation of the init script unconditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/input-event-daemon/input-event-daemon.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 534fe90..0bafdc4 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -21,9 +21,11 @@ define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
 	[ -f $(TARGET_DIR)/etc/input-event-daemon.conf ] || \
 		$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
 			$(TARGET_DIR)/etc/input-event-daemon.conf
-	[ -f $(TARGET_DIR)/etc/init.d/S99input-event-daemon ] || \
-		$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
-			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
+endef
+
+define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
+		$(TARGET_DIR)/etc/init.d/S99input-event-daemon
 endef
 
 $(eval $(generic-package))
-- 
2.1.0
