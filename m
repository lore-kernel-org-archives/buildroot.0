From: Julien Olivain <juju@cotds.org>
Date: Sat, 28 Dec 2019 18:39:10 +0100
Subject: [Buildroot] [PATCH 1/1] configs/nitrogen8m: add u-boot-nodtb.bin
 custom target
Message-ID: <20191228173910.227339-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent change introduced in [1] use the "nodtb" variant of u-boot
image. This broke the nitrogen8m_defconfig which was not including the
generation of this U-Boot image. This patch add this target.

[1] https://git.buildroot.org/buildroot/commit/?id=d130f0a83700b52ba51ebde22885f0f9e577ee29

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/389451762

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 configs/nitrogen8m_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 9b758f0b97..4ca7e60700 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -40,6 +40,8 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-imx_v2017.03_4.9.51_imx8m_ga
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/b661d854.tar.gz"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 
-- 
2.24.1
