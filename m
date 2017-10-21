From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:16:25 +0200
Subject: [Buildroot] [git commit] support/testing: update ISO9660 test case
	Linux kernel
Message-ID: <20171021190904.B51BC810CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb5b1323762e18b3e9db42670efe3e1d9e91ed5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux 4.0 kernel doesn't build with gcc 6.x, which is used since
the toolchain update in commit
193dfffa834a4cd76bc7b41089bd93d4c37dfc65 ("support/testing: use more
recent toolchains"). So let's update to Linux 4.11 instead (like the
existing Qemu x86 defconfig does), and update the kernel configuration
file accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../testing/conf/minimal-x86-qemu-kernel.config    | 45 +++++++++++++++++-----
 support/testing/tests/fs/test_iso9660.py           |  2 +-
 2 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/support/testing/conf/minimal-x86-qemu-kernel.config b/support/testing/conf/minimal-x86-qemu-kernel.config
index 8f6ceef..4aaaab7 100644
--- a/support/testing/conf/minimal-x86-qemu-kernel.config
+++ b/support/testing/conf/minimal-x86-qemu-kernel.config
@@ -1,23 +1,48 @@
-# CONFIG_64BIT is not set
 CONFIG_SYSVIPC=y
-CONFIG_BLK_DEV_INITRD=y
-# CONFIG_SUSPEND is not set
-# CONFIG_ACPI is not set
-CONFIG_CPU_IDLE=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
+CONFIG_SCSI_VIRTIO=y
 CONFIG_ATA=y
 CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_POWER_SUPPLY=y
-CONFIG_THERMAL=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_BOCHS=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-# CONFIG_VIRTUALIZATION is not set
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 0cb15ad..5d945a3 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -18,7 +18,7 @@ BASIC_CONFIG = \
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
+    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
     BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
     BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
     # BR2_TARGET_ROOTFS_TAR is not set
