From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  9 Jun 2021 22:59:47 +0300
Subject: [Buildroot] [PATCH v2 12/28]
 configs/friendlyarm_nanopi_neo_plus2_defconfig: switch to mainline ATF
In-Reply-To: <20210609200003.2866122-1-geomatsi@gmail.com>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
Message-ID: <20210609200003.2866122-13-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to mainline ATF that provides basic support for H5 and A64.
Note that allwinner platform layer does not provide support for
GCC stack protection, so make sure to disable this ATF feature.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/friendlyarm_nanopi_neo_plus2_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/friendlyarm_nanopi_neo_plus2_defconfig b/configs/friendlyarm_nanopi_neo_plus2_defconfig
index 461e468cb6..730ff3ee6f 100644
--- a/configs/friendlyarm_nanopi_neo_plus2_defconfig
+++ b/configs/friendlyarm_nanopi_neo_plus2_defconfig
@@ -8,10 +8,10 @@ BR2_ROOTFS_OVERLAY="board/friendlyarm/nanopi-neo-plus2/rootfs_overlay"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP=y
 R2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
-- 
2.31.1
