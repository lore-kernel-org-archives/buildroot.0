From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon,  5 Mar 2018 12:15:04 -0500
Subject: [Buildroot] [PATCH 2/3] board/technologic/ts5x00: rename to ts5500
In-Reply-To: <20180305171505.4003-1-vivien.didelot@savoirfairelinux.com>
References: <20180305171505.4003-1-vivien.didelot@savoirfairelinux.com>
Message-ID: <20180305171505.4003-3-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the confusing and misleading ts5x00 directory to a real reference
platform name, ts5500. The readme.txt file already states the support
for both TS-5500 and TS-5400 platforms.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 .gitlab-ci.yml                                                        | 2 +-
 .../{ts5x00 => ts5500}/fs-overlay/boot/syslinux/syslinux.cfg          | 0
 board/technologic/{ts5x00 => ts5500}/linux-4.14.config                | 0
 board/technologic/{ts5x00 => ts5500}/readme.txt                       | 2 +-
 configs/{ts5x00_defconfig => ts5500_defconfig}                        | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename board/technologic/{ts5x00 => ts5500}/fs-overlay/boot/syslinux/syslinux.cfg (100%)
 rename board/technologic/{ts5x00 => ts5500}/linux-4.14.config (100%)
 rename board/technologic/{ts5x00 => ts5500}/readme.txt (98%)
 rename configs/{ts5x00_defconfig => ts5500_defconfig} (80%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f76e53b565..be00bc56a4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -235,7 +235,7 @@ telit_evk_pro3_defconfig: *defconfig
 toradex_apalis_imx6_defconfig: *defconfig
 ts4800_defconfig: *defconfig
 ts4900_defconfig: *defconfig
-ts5x00_defconfig: *defconfig
+ts5500_defconfig: *defconfig
 ts7680_defconfig: *defconfig
 wandboard_defconfig: *defconfig
 warp7_defconfig: *defconfig
diff --git a/board/technologic/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg b/board/technologic/ts5500/fs-overlay/boot/syslinux/syslinux.cfg
similarity index 100%
rename from board/technologic/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
rename to board/technologic/ts5500/fs-overlay/boot/syslinux/syslinux.cfg
diff --git a/board/technologic/ts5x00/linux-4.14.config b/board/technologic/ts5500/linux-4.14.config
similarity index 100%
rename from board/technologic/ts5x00/linux-4.14.config
rename to board/technologic/ts5500/linux-4.14.config
diff --git a/board/technologic/ts5x00/readme.txt b/board/technologic/ts5500/readme.txt
similarity index 98%
rename from board/technologic/ts5x00/readme.txt
rename to board/technologic/ts5500/readme.txt
index 1e50682980..1e73ab3ea1 100644
--- a/board/technologic/ts5x00/readme.txt
+++ b/board/technologic/ts5500/readme.txt
@@ -13,7 +13,7 @@ and additional sysfs attributes under /sys/devices/platform/).
 
 To build the default configuration you only have to:
 
-    $ make ts5x00_defconfig
+    $ make ts5500_defconfig
     $ make
 
 You will need a Compact Flash card of sufficient size and the first or only
diff --git a/configs/ts5x00_defconfig b/configs/ts5500_defconfig
similarity index 80%
rename from configs/ts5x00_defconfig
rename to configs/ts5500_defconfig
index 19259260b7..871c02e95f 100644
--- a/configs/ts5x00_defconfig
+++ b/configs/ts5500_defconfig
@@ -7,14 +7,14 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
-BR2_ROOTFS_OVERLAY="board/technologic/ts5x00/fs-overlay"
+BR2_ROOTFS_OVERLAY="board/technologic/ts5500/fs-overlay"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5x00/linux-4.14.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5500/linux-4.14.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # rootfs
-- 
2.16.2
