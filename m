From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 10:26:29 +0200
Subject: [Buildroot] [git commit] wandboard: defconfig: simplify u-boot
	configuration
Message-ID: <20160628082802.3712C7FCBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=715a092b8c50eaedee137fc6e995afc9c1c628f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change. The git hash used is actually just the 2015.07
release, so use the release tarball instead of git.  Likewise, we have a
dedicated option for u-boot.img, so use that instead of the custom format.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/wandboard_defconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index d616d0e..cd06f40 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -11,11 +11,9 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_USE_DEFCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="33711bdd4a4dce942fb5ae85a68899a8357bdd94"
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.img"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_ENVIMAGE=y
