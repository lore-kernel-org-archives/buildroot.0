From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:27:39 +0100
Subject: [Buildroot] [git commit] input-event-daemon: install configuration
	file unconditionally
Message-ID: <20141201233009.6E31380051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19c8fa96b5a1396c49abe21efda8a31b9a743816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/input-event-daemon/input-event-daemon.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 0bafdc4..67b8cc4 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -18,9 +18,8 @@ endef
 define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -D $(@D)/input-event-daemon \
 		$(TARGET_DIR)/usr/bin/input-event-daemon
-	[ -f $(TARGET_DIR)/etc/input-event-daemon.conf ] || \
-		$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
-			$(TARGET_DIR)/etc/input-event-daemon.conf
+	$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
+		$(TARGET_DIR)/etc/input-event-daemon.conf
 endef
 
 define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSV
