From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 22:56:05 +0100
Subject: [Buildroot] [git commit] configs: galileo: correct genimage
	dependencies
Message-ID: <20160313220628.7F39E7F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d4f278d75ebdde92a5ab06f66a896ce01e91b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The genimage configuration creates a vfat filesystem, so ensure we have
dosfstools / mtools built for the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/galileo_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index ba8f62f..9334266 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -20,5 +20,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_I386_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
