From: Sam Voss <samuel.voss@rockwellcollins.com>
Date: Wed, 26 Oct 2016 09:06:12 -0500
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
In-Reply-To: <20161025220305.1cb73355@free-electrons.com>
References: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161025220305.1cb73355@free-electrons.com>
Message-ID: <CAH=K+6khOEyfhomv9HMbOnB7eNcgiX4V0Z_vALNLDAdL5QLVww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

>
> Could you show an example on how this script is intended to be used ?
>

Assuming you have already done a `make linux-savedefconfig` and have
an older version to compare against (example files given below), it
would be used (from the
buildroot root directory) as follows:

./support/scripts/gen-config-fragment.sh
output/build/linux-4.8.1/defconfig  board/qemu/x86_64/linux-4.8.config

File 1 - output/build/linux-4.8.1/defconfig


CONFIG_SYSVIPC=y
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_SMP=y
# CONFIG_X86_MPPARSE is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_SD=y
CONFIG_SCSI_VIRTIO=y
CONFIG_ATA=y
CONFIG_ATA_PIIX=y
CONFIG_NETDEVICES=y
CONFIG_VIRTIO_NET=y
CONFIG_NE2K_PCI=y
CONFIG_8139CP=y
CONFIG_INPUT_EVDEV=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_DRM=y
CONFIG_DRM_QXL=y
CONFIG_DRM_BOCHS=y
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_HDA_INTEL=y
CONFIG_SND_HDA_GENERIC=y
CONFIG_USB=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_UHCI_HCD=y
CONFIG_USB_STORAGE=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
CONFIG_EXT4_FS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y

File 2 - Original defconfig - board/qemu/x86_64/linux-4.8.config

CONFIG_SYSVIPC=y
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_SMP=y
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_SD=y
CONFIG_SCSI_VIRTIO=y
CONFIG_ATA=y
CONFIG_ATA_PIIX=y
CONFIG_NETDEVICES=y
CONFIG_VIRTIO_NET=y
CONFIG_NE2K_PCI=y
CONFIG_8139CP=y
CONFIG_INPUT_EVDEV=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_DRM=y
CONFIG_DRM_BOCHS=y
CONFIG_DRM_QXL=y
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_HDA_INTEL=y
CONFIG_SND_HDA_GENERIC=y
CONFIG_USB=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_UHCI_HCD=y
CONFIG_USB_STORAGE=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
CONFIG_EXT4_FS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y

Giving output file of - output/build/linux-4.8.1/defconfig.fragment

CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS=y
# CONFIG_X86_MPPARSE is not set

Should I add an example execution of this in the header of the script?
 Something like the following?

#
# Linux Example
# ./support/scripts/gen-config-fragment.sh <output
dir>/build/linux-x.y.z/defconfig
board/custom-board/linux-x.y.z.config
#
# Busybox Example using default base config
# ./support/scripts/gen-config-fragment.sh <output
dir>/build/busybox-x.y.z/.config
#
# Busybox Example using custom base config
# ./support/scripts/gen-config-fragment.sh <output
dir>/build/busybox-x.y.z/.config board/custom-board/busybox.config
