From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Feb 2016 01:24:28 +0100
Subject: [Buildroot] [PATCH 4/9] olimex_a20_olinuxino_micro: initialize the
	network with DHCP
In-Reply-To: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1456187073-2876-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To allow a more complete "out-of-the-box" startup with the defconfig,
enable automatic network configuration of eth0 using DHCP.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 configs/olimex_a20_olinuxino_micro_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 6d05f74bea8f..420252c2c36b 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
 
-- 
1.9.1
