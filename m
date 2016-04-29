From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Apr 2016 14:38:25 -0300
Subject: [Buildroot] [PATCH 2/3] qemu/x86*: enable virtio for kernel config
In-Reply-To: <1461951506-12010-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461951506-12010-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461951506-12010-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It has better performance for block and net.
Enable virgl (DRM_VIRTIO_GPU) support for 3D acceleration.
And also DRM_BOCHS for better stdvga acceleration.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86_64/linux-4.5.config | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/board/qemu/x86_64/linux-4.5.config b/board/qemu/x86_64/linux-4.5.config
index c630f02..e3bd145 100644
--- a/board/qemu/x86_64/linux-4.5.config
+++ b/board/qemu/x86_64/linux-4.5.config
@@ -2,21 +2,30 @@ CONFIG_SYSVIPC=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
 CONFIG_ATA=y
 CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
 CONFIG_NE2K_PCI=y
 CONFIG_8139CP=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_DRM=y
+CONFIG_DRM_BOCHS=y
 CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
@@ -26,6 +35,11 @@ CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_UHCI_HCD=y
 CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.7.3
