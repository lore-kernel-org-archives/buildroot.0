From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Sun, 25 Oct 2015 03:12:57 +0200
Subject: [Buildroot] [PATCH 1/2] configs/riotboard: Decouple u-boot version
	from the default value
Message-ID: <1445735578-18117-1-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use custom version for U-Boot, instead of using the default value as defined
in BR2_TARGET_UBOOT_VERSION.

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 configs/riotboard_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 708a860..96c3619 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -14,7 +14,8 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_VERSION="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
 BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
-- 
2.1.4
