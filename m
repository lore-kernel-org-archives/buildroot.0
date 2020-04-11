From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 11 Apr 2020 16:25:42 -0600
Subject: [Buildroot] [PATCH 1/1] v4l2loopback: enable required kernel options
Message-ID: <20200411222542.64271-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
ERROR: "video_ioctl2" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "__video_register_device" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "v4l2_ctrl_new_custom" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "v4l2_ctrl_handler_init_class" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "video_device_release" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "video_device_alloc" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "v4l2_device_register" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "v4l2_ctrl_handler_free" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "v4l2_device_unregister" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "video_unregister_device" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
ERROR: "video_devdata" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3d9052a337..2dfbf25a6c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -416,6 +416,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX,$(@D)/.config))
+	$(if $(BR2_PACKAGE_V4L2LOOPBACK),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_SUPPORT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_CAMERA_SUPPORT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV,$(@D)/.config))
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
-- 
2.20.1
