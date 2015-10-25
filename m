From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 11:07:02 +0100
Subject: [Buildroot] [git commit] configs/riotboard: Decouple u-boot version
	from the default value
Message-ID: <20151025100749.F262C81DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2261043c19885342213f3c9a5e5d2061f7daaf89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use custom version for U-Boot, instead of using the default value as defined
in BR2_TARGET_UBOOT_VERSION.

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/riotboard_defconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
 
