From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Apr 2012 23:14:04 +0200
Subject: [Buildroot] [git commit] Enable cgroups in Linux if we use systemd
Message-ID: <20120402211515.41297969C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90759a663629d3c936c0e4392088a4e618aaf5fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
