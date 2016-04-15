From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 13:43:26 +0200
Subject: [Buildroot] [git commit] freescale_imx6sxsabresd_defconfig: fix
	kernel headers version
Message-ID: <20160415114521.12D28803DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08f7d13570aa2a693ca16f1e41fc3760ecd6b21b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/123187910

Commit 1e5bc05a04d (configs: freescale_imx6*: bump version to
3.14.52-1.1.0_ga) updated the kernel but forgot to change the kernel headers
version to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx6sxsabresd_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 06ab10a..943528b 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -5,8 +5,8 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 3.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+# Linux headers same as kernel, a 3.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
