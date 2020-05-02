From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 May 2020 23:28:09 +0200
Subject: [Buildroot] [PATCH 3/6] configs/olimex_a20_olinuxino_lime{,
 2}: use Python 3.x
In-Reply-To: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200502212812.51219-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The olimex_a20_olinuxino_lime{,2}_defconfig uses U-Boot 2020.04 since
commit 6b805c3ab70b5ee63c7dcd3a4aa48a999a8a43c3. This new U-Boot
version needs Python 3.x for pylibfdt.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054468
  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054466

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 2 ++
 configs/olimex_a20_olinuxino_lime_defconfig  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index eb6a82c2f6..6e27383a1c 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -46,6 +46,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 740fd4357a..415fbfc066 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -46,6 +46,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.26.2
