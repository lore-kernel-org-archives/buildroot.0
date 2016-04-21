From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:06:08 +0200
Subject: [Buildroot] [git commit] board: rename ts to technologic
Message-ID: <20160421210612.68F2681E80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56047fa97d8ca433948c30269ae6fc107b67ce70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other projects, such as Linux [1] and U-Boot [2], use "technologic" for
this manufacturer. To be more consistent across all of them, rename the
board/ts folder to board/technologic.

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/vendor-prefixes.txt
[2] http://git.denx.de/?p=u-boot.git;a=tree;f=board/technologic;hb=HEAD

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{ts => technologic}/ts5x00/fs-overlay/boot/syslinux/syslinux.cfg  | 0
 board/{ts => technologic}/ts5x00/linux-3.17.config                    | 0
 board/{ts => technologic}/ts5x00/readme.txt                           | 0
 configs/ts5x00_defconfig                                              | 4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)

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
