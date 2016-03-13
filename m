From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 23:00:09 +0100
Subject: [Buildroot] [git commit] configs: orangepipc: correct genimage
	dependencies
Message-ID: <20160313220628.8D6607F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a990616192b9d9d5bd6a43f163822b0b8d6555c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The genimage configuration creates a vfat filesystem, so ensure we have
dosfstools / mtools built for the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepipc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index 3f1aaac..eb149d9 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -30,4 +30,5 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
