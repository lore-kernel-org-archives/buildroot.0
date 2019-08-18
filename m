From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Sun, 18 Aug 2019 22:13:53 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bump kernel for TS-7680
Message-ID: <20190818201353.14398-1-julien.grossholtz@openest.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TS-7680 defconfig does not build with gcc 8.x and 9.x because it
uses an old 3.14 kernel. Technologic Systems, the board manufacturer
recently released an updated 4.9 based kernel on a separate repository
on github.

Bump the kernel release from 3.14.28 to 4.19.186 and update the linux
defconfig name as requested in the TS-7680 documentation [1].

[1] https://wiki.embeddedarm.com/wiki/TS-7680#Linux_4.9.y

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
---
 board/technologic/ts7680/readme.txt | 3 +--
 configs/ts7680_defconfig            | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/technologic/ts7680/readme.txt b/board/technologic/ts7680/readme.txt
index 4ddd4915b5..43d5d135e8 100644
--- a/board/technologic/ts7680/readme.txt
+++ b/board/technologic/ts7680/readme.txt
@@ -10,8 +10,7 @@ Wi-Fi, microSD card, eMMC, NOR Flash, USB host port, CAN ports,
 relays and ADC/DAC. More details on the board here:
 https://wiki.embeddedarm.com/wiki/TS-7680
 
-The TS-7680 uses a 3.14.28 Linux kernel provided by
-Technologic Systems.
+The TS-7680 uses a 4.9 Linux kernel provided by Technologic Systems.
 
 To build the default configuration you only have to run:
 
diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
index 829af057a2..7eb57ab1c5 100644
--- a/configs/ts7680_defconfig
+++ b/configs/ts7680_defconfig
@@ -1,11 +1,11 @@
 BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/technologic/ts7680/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedarm,linux-3.14.28-imx28,ff01621df09b97d9fd546d1b49f4013060142892)/linux-ff01621df09b97d9fd546d1b49f4013060142892.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="ts76xx"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedarm,linux-4.9.y,d03d426e6abd95a973bc669315206295713c17e8)/linux-d03d426e6abd95a973bc669315206295713c17e8.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="ts_imx28"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.21.0
