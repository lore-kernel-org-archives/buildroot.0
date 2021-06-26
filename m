From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 17:10:42 +0200
Subject: [Buildroot] [git commit] configs/orangepi_zero_plus2_defconfig:
 switch to mainline TF-A
Message-ID: <20210626144011.A9B968E365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d48a91f9ed9f348a4eece191dc3bd16c6c57c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to mainline TF-A that provides basic support for H5 and A64.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/orangepi_zero_plus2_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index aa4c5c9413..3085dfe08c 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -8,10 +8,9 @@ BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
