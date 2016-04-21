From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Date: Thu, 21 Apr 2016 12:21:12 -0400
Subject: [Buildroot] [PATCH 1/2] board: rename ts to technologic
In-Reply-To: <1461255673-11443-1-git-send-email-damien.riegel@savoirfairelinux.com>
References: <1461255673-11443-1-git-send-email-damien.riegel@savoirfairelinux.com>
Message-ID: <1461255673-11443-2-git-send-email-damien.riegel@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other projects, such as Linux [1] and U-Boot [2], use "technologic" for
this manufacturer. To be more consistent across all of them, rename the
board/ts folder to board/technologic.

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/vendor-prefixes.txt
[2] http://git.denx.de/?p=u-boot.git;a=tree;f=board/technologic;hb=HEAD

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
 .../{ts => technologic}/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg  | 0
 board/{ts => technologic}/ts5x00/linux-3.17.config                    | 0
 board/{ts => technologic}/ts5x00/readme.txt                           | 0
 configs/ts5x00_defconfig                                              | 4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename board/{ts => technologic}/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg (100%)
 rename board/{ts => technologic}/ts5x00/linux-3.17.config (100%)
 rename board/{ts => technologic}/ts5x00/readme.txt (100%)

diff --git a/board/ts/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg b/board/technologic/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
similarity index 100%
rename from board/ts/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
rename to board/technologic/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg
diff --git a/board/ts/ts5x00/linux-3.17.config b/board/technologic/ts5x00/linux-3.17.config
similarity index 100%
rename from board/ts/ts5x00/linux-3.17.config
rename to board/technologic/ts5x00/linux-3.17.config
diff --git a/board/ts/ts5x00/readme.txt b/board/technologic/ts5x00/readme.txt
similarity index 100%
rename from board/ts/ts5x00/readme.txt
rename to board/technologic/ts5x00/readme.txt
diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
index 655704f..5310886 100644
--- a/configs/ts5x00_defconfig
+++ b/configs/ts5x00_defconfig
@@ -7,14 +7,14 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
-BR2_ROOTFS_OVERLAY="board/ts/ts5x00/fs-overlay"
+BR2_ROOTFS_OVERLAY="board/technologic/ts5x00/fs-overlay"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ts/ts5x00/linux-3.17.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5x00/linux-3.17.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # rootfs
-- 
2.5.0
