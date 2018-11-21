From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 21 Nov 2018 22:01:42 +0100
Subject: [Buildroot] [PATCH] configs/chiliboard: remove explicit getty port
Message-ID: <20181121210142.21769-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using default value (console) works well, so there is no reason to set
tty explicitly. Additionally after selecting newer kernels (tested
with 4.19 and 4.20-rc3) ttyO0 no longer works due to missing device
node.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/grinn_chiliboard_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index 81d7bae911..84f24e1cc4 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/chiliboard/post-image.sh"
 BR2_LINUX_KERNEL=y
-- 
2.19.1
