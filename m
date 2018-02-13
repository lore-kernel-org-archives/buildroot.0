From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:21:10 +0100
Subject: [Buildroot] [git commit branch/next] configs/amarula_vyasa_rk3288:
 uboot needs pylibfdt
Message-ID: <20180213222112.A31388874D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27562c2bf3871e7d5f3b64717b07f2a7230b542b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For this platform, u-boot uses dtoc during the build, which needs Python
libfdt. Set the corresponding option TARGET_UBOOT_NEEDS_PYLIBFDT in the
defconfig.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index a020b353b9..4cd46e79de 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -13,6 +13,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
