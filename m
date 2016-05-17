From: oferh at marvell.com <oferh@marvell.com>
Date: Tue, 17 May 2016 11:47:00 +0300
Subject: [Buildroot] [PATCH 1/1] linux: arm: config endiness based on BR2
	config
Message-ID: <1463474820-18073-1-git-send-email-oferh@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ofer Heifetz <oferh@marvell.com>

By default linux ARM arch is implicit configured LE,
when BR2 is configured BE, modify the linux config to BE
for ARM arch.

Signed-off-by: Ofer Heifetz <oferh@marvell.com>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index d88060e..71545e4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -218,6 +218,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
+	$(if $(BR2_armeb)$(BR2_aarch64_be),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_BIG_ENDIAN,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
 	# As the kernel gets compiled before root filesystems are
-- 
1.9.1
