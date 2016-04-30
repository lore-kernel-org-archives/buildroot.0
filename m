From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:56:27 +0200
Subject: [Buildroot] [git commit] qemu/x86: use symlinked kernel config
Message-ID: <20160430131604.EE6BA818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f85a91221056b32a2de4f11ea0762610ea21230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's exactly the same as the x86_64 variant so just create a symlink.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/x86/linux-4.5.config | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/board/qemu/x86/linux-4.5.config b/board/qemu/x86/linux-4.5.config
deleted file mode 100644
index c630f02..0000000
--- a/board/qemu/x86/linux-4.5.config
+++ /dev/null
@@ -1,31 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_SMP=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_ATA_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_NE2K_PCI=y
-CONFIG_8139CP=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_DRM=y
-CONFIG_DRM_QXL=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_HDA_INTEL=y
-CONFIG_SND_HDA_GENERIC=y
-CONFIG_USB=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/x86/linux-4.5.config b/board/qemu/x86/linux-4.5.config
new file mode 120000
index 0000000..735bcf7
--- /dev/null
+++ b/board/qemu/x86/linux-4.5.config
@@ -0,0 +1 @@
+../x86_64/linux-4.5.config
\ No newline at end of file
