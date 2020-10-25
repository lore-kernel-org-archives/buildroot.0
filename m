From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 09:50:28 +0100
Subject: [Buildroot] [git commit] package/busybox: install example
 zcip.script when zcip is enabled
Message-ID: <20201025084452.98E2881675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aebefc1e5a70a834813a218b37633629e7a41562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this way zcip will work out of the box when configured

Signed-off-by: Sven Oliver Moll <buildroot@svol.li>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 01f7331221..76ab30780c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -208,6 +208,13 @@ define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 	fi
 endef
 
+define BUSYBOX_INSTALL_ZCIP_SCRIPT
+	if grep -q CONFIG_ZCIP=y $(@D)/.config; then \
+		$(INSTALL) -m 0755 -D $(@D)/examples/zcip.script \
+			$(TARGET_DIR)/usr/share/zcip/default.script; \
+	fi
+endef
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 
 define BUSYBOX_SET_INIT
@@ -366,6 +373,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
+	$(BUSYBOX_INSTALL_ZCIP_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
 
