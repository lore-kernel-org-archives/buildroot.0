From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 23 Mar 2012 16:49:53 +0100
Subject: [Buildroot] [PATCH 2/5] Enable cgroups in Linux if we use systemd
In-Reply-To: <cover.1332517725.git.maxime.ripard@free-electrons.com>
References: <cover.1332517725.git.maxime.ripard@free-electrons.com>
Message-ID: <bf3ae28229199695f3d688835a23f34281f3fcc9.1332517725.git.maxime.ripard@free-electrons.com>
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
index 6cb1efc..16f9916 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -162,6 +162,8 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
+	$(if $(BR2_PACKAGE_SYSTEMD),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
-- 
1.7.5.4
