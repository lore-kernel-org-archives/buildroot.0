From: heiko at zuerker.org <heiko@zuerker.org>
Date: Thu, 16 Dec 2010 20:47:11 -0600
Subject: [Buildroot] [PATCH] sysvinit: install using the Makefile,
	so we don't miss half the tools
Message-ID: <09dfe04e8cb22aa8d79784d767b1103d875b26af.1292553963.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/sysvinit/sysvinit.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index b22f0f2..83ae1a3 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -28,9 +28,7 @@ define SYSVINIT_BUILD_CMDS
 endef
 
 define SYSVINIT_INSTALL_TARGET_CMDS
-	for x in halt init shutdown; do \
-		install -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
-	done
+	make -C $(@D) install ROOT=$(TARGET_DIR)
 	# Override Busybox's inittab with an inittab compatible with
 	# sysvinit
 	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
-- 
1.7.3.2
