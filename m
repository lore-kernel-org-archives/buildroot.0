From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 31 Jul 2012 09:50:51 +0200
Subject: [Buildroot] [PATCH] linux: enable ubi and ubifs if we build a ubifs
	root filesystem
Message-ID: <1343721051-8380-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index ca216a3..cf43818 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,6 +166,9 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
+	$(if $(BR2_TARGET_ROOTFS_UBIFS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MTD_UBI,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_UBIFS_FS,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
-- 
1.7.11.3
