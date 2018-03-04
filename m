From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:19 +0100
Subject: [Buildroot] [PATCH 05/23] configs/qemu_x86_defconfig: remove kernel
 options that need openssl
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wireless support ends up enabling CONFIG_SYSTEM_TRUSTED_KEYRING, which
requires openssl to be available on the host, so disable wireless
support, which isn't needed in Qemu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/x86/linux-4.15.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/qemu/x86/linux-4.15.config b/board/qemu/x86/linux-4.15.config
index 0e59b87bd6..79f7537d80 100644
--- a/board/qemu/x86/linux-4.15.config
+++ b/board/qemu/x86/linux-4.15.config
@@ -9,6 +9,7 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+# CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
@@ -20,6 +21,7 @@ CONFIG_NETDEVICES=y
 CONFIG_VIRTIO_NET=y
 CONFIG_NE2K_PCI=y
 CONFIG_8139CP=y
+# CONFIG_WLAN is not set
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.14.3
