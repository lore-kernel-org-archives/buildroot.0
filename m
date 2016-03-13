From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 23:01:36 +0100
Subject: [Buildroot] [git commit] configs: pandaboard: correct genimage
	dependencies
Message-ID: <20160313220628.9B82D7F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9c2006e31911611a077396b63d0da4ac8fd2055
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The genimage configuration creates a vfat filesystem, so ensure we have
dosfstools / mtools built for the host.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pandaboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 7ae1a50..3223d2b 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -26,3 +26,4 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
