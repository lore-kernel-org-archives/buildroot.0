From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:51:09 +0100
Subject: [Buildroot] [git commit] input-event-daemon: use
	<pkg>_INSTALL_INIT_SYSV mechanism
Message-ID: <20141201221140.A4B878002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8dc7677521e1ccd48ee76c90ea09b07bf99dbc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also makes the installation of the init script unconditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/input-event-daemon/input-event-daemon.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

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
