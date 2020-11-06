From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri,  6 Nov 2020 19:27:00 +0100
Subject: [Buildroot] [PATCH 2/3] configs/orangepi_pc: use Python 3.x
In-Reply-To: <20201106182701.17410-1-m.niestroj@grinn-global.com>
References: <20201106182701.17410-1-m.niestroj@grinn-global.com>
Message-ID: <20201106182701.17410-3-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New U-Boot versions (such as 2020.07 being used) need Python 3.x for
pylibfdt.

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/831421100

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/orangepi_pc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 90ad50b783..c1afb8566a 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -23,6 +23,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.11.0
