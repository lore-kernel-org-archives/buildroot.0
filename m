From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:48:07 +0100
Subject: [Buildroot] [git commit] board/technologic/ts5x00: rename to ts5500
Message-ID: <20180311085013.D520681217@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f17540b170395d5c29eb111bfcacdb2540a2fb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename the confusing and misleading ts5x00 directory to a real reference
platform name, ts5500. The readme.txt file already states the support
for both TS-5500 and TS-5400 platforms.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                                                        | 2 +-
 .../{ts5x00 => ts5500}/fs-overlay/boot/syslinux/syslinux.cfg          | 0
 board/technologic/{ts5x00 => ts5500}/linux-4.14.config                | 0
 board/technologic/{ts5x00 => ts5500}/readme.txt                       | 2 +-
 configs/{ts5x00_defconfig => ts5500_defconfig}                        | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4cdaa09da5..e2de78d89c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -230,7 +230,7 @@ stm32f469_disco_defconfig: *defconfig
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
