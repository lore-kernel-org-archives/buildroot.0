From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 22 Mar 2012 10:27:17 +0100
Subject: [Buildroot] [PATCH 2/5] Enable cgroups in Linux if we use systemd
In-Reply-To: <cover.1332408273.git.maxime.ripard@free-electrons.com>
References: <cover.1332408273.git.maxime.ripard@free-electrons.com>
Message-ID: <b12357fc4c455ffa8b89ac931225dce417870e74.1332408273.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6cb1efc..93dd008 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -163,6 +163,8 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
+	$(if $(BR2_PACKAGE_SYSTEMD),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
 endef
 
 # Compilation. We make sure the kernel gets rebuilt when the
-- 
1.7.5.4
