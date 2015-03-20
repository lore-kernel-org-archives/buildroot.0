From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:37:07 +0100
Subject: [Buildroot] [git commit] irqbalance: move systemd service file to
	/usr/lib
Message-ID: <20150320194323.612918181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2702ac5016cca013350f6c2d5639c4a4263bfdd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irqbalance/irqbalance.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index e3ef0bb..4e6b181 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -26,9 +26,9 @@ endef
 
 define IRQBALANCE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/irqbalance/irqbalance.service \
-		$(TARGET_DIR)/etc/systemd/system/irqbalance.service
+		$(TARGET_DIR)/usr/lib/systemd/system/irqbalance.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../irqbalance.service \
+	ln -fs ../../../../usr/lib/systemd/system/irqbalance.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/irqbalance.service
 endef
 
