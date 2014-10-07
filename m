From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 17:00:07 +0200
Subject: [Buildroot] [git commit] qemu/sh4-r2d: update to the latest versions
Message-ID: <20141007150307.E8235B0C2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=949be8fd62ac91c1d7a543bf98e020d01369140c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.16.config => linux-3.17.config}       |   28 +-------------------
 board/qemu/sh4-r2d/readme.txt                      |    2 +-
 configs/qemu_sh4_r2d_defconfig                     |   10 +++---
 3 files changed, 7 insertions(+), 33 deletions(-)

diff --git a/board/qemu/sh4-r2d/linux-3.16.config b/board/qemu/sh4-r2d/linux-3.17.config
similarity index 68%
rename from board/qemu/sh4-r2d/linux-3.16.config
rename to board/qemu/sh4-r2d/linux-3.17.config
index 5fc878c..ce16cb8 100644
--- a/board/qemu/sh4-r2d/linux-3.16.config
+++ b/board/qemu/sh4-r2d/linux-3.17.config
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
@@ -33,12 +32,10 @@ CONFIG_PATA_PLATFORM=y
 CONFIG_NETDEVICES=y
 CONFIG_8139CP=y
 # CONFIG_WLAN is not set
-CONFIG_INPUT_FF_MEMLESS=m
 # CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_SERIAL_SH_SCI_CONSOLE=y
@@ -46,45 +43,22 @@ CONFIG_HW_RANDOM=y
 CONFIG_SPI=y
 CONFIG_SPI_SH_SCI=y
 CONFIG_MFD_SM501=y
-CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
 CONFIG_FB_SH_MOBILE_LCDC=m
 CONFIG_FB_SH_MOBILE_HDMI=m
 CONFIG_FB_SM501=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND_YMFPCI=m
 CONFIG_SOUND_PRIME=m
-CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
-CONFIG_HID_BELKIN=y
-CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
-CONFIG_HID_CYPRESS=y
-CONFIG_HID_EZKEY=y
-CONFIG_HID_GYRATION=y
-CONFIG_HID_LOGITECH=y
-CONFIG_HID_MICROSOFT=y
-CONFIG_HID_MONTEREY=y
-CONFIG_HID_PANTHERLORD=y
-CONFIG_HID_PETALYNX=y
-CONFIG_HID_SAMSUNG=y
-CONFIG_HID_SONY=y
-CONFIG_HID_SUNPLUS=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_STORAGE=y
-CONFIG_USB_LIBUSUAL=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_R9701=y
-CONFIG_EXT2_FS=y
+CONFIG_EXT4_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_PROC_KCORE=y
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 956fbdd..732c019 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.1.0
+Tested with QEMU 2.1.2
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 860737b..4623c66 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -14,15 +14,15 @@ BR2_TARGET_ROOTFS_EXT2=y
 # doesn't use floating point operations.
 BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
-# Lock to 3.15 headers to avoid breaking with newer kernels
+# Lock to 3.17 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.16.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.16.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.17.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
