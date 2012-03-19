From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 19 Mar 2012 16:59:37 +0100
Subject: [Buildroot] [PATCH 3/6] Enable cgroups in Linux if we use systemd
In-Reply-To: <cover.1332172636.git.maxime.ripard@free-electrons.com>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
Message-ID: <707571b9011f506bef9015c6f572208af6b534ca.1332172636.git.maxime.ripard@free-electrons.com>
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
index ae236d4..52635fd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -149,6 +149,8 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
+	$(if $(BR2_PACKAGE_SYSTEMD),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
 endef
 
 # Compilation. We make sure the kernel gets rebuilt when the
-- 
1.7.5.4
