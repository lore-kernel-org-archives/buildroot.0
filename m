From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Dec 2018 21:54:07 +0100
Subject: [Buildroot] [git commit] configs/chiliboard: remove explicit getty
 port
Message-ID: <20181209205212.0592286DC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d129ae3ce938c3a33972afdc1d5be39e0211dd79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using default value (console) works well, so there is no reason to set
tty explicitly. Additionally after selecting newer kernels (tested
with 4.19 and 4.20-rc3) ttyO0 no longer works due to missing device
node.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
