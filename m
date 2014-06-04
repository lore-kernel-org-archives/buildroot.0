From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jun 2014 23:19:53 +0200
Subject: [Buildroot] [git commit] busybox: use SED macro instead of 'sed -i'
Message-ID: <20140604212607.7A5859C2B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74bc709e636c2383194d39ef4f1679f76deae372
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index af1d13f..3d87cd7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -184,7 +184,7 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
 		install -D -m 0755 package/busybox/S15watchdog \
 			$(TARGET_DIR)/etc/init.d/S15watchdog && \
-		sed -i s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
+		$(SED) s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
 			$(TARGET_DIR)/etc/init.d/S15watchdog
 endef
 endif
