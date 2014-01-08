From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 22:28:00 +0100
Subject: [Buildroot] [git commit] linux: force inotify kernel option when
	udev is used as dev handler
Message-ID: <20140108213639.B8BD99C3DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd53398cd6f6b62c3c2834ea7ec77298b4de2488
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop unneeded devtmpfs handling]
Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index fa8aa0c..ab25fe9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -185,6 +185,8 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
+	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
