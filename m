From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:15:58 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabreauto: select
 BR2_TARGET_UBOOT_NEEDS_LZOP
Message-ID: <20191014211014.4B2E88E079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0d288e754ea13613668f6d343425cb76dec1b89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select BR2_TARGET_UBOOT_NEEDS_LZOP in order to avoid the following
build error on a host machine without lzop installed:

/bin/sh: 1: lzop: not found

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/318105190

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6-sabreauto_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
index ae5598fe37..aa8667835c 100644
--- a/configs/imx6-sabreauto_defconfig
+++ b/configs/imx6-sabreauto_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabreauto"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_NEEDS_LZOP=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
