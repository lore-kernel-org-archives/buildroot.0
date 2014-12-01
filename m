From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:37:58 +0100
Subject: [Buildroot] [git commit] busybox: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.58AF48002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=828509fcbe15e26d1d89744c3d38f076a6067bad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f0fa851..eb2f3f1 100644
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
