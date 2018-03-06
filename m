From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:25:15 +0100
Subject: [Buildroot] [git commit] configs/qemu_x86_64_defconfig: remove
 kernel options that need openssl/libelf
Message-ID: <20180306143235.59BB282256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=248161d6faedc928a49391dccf9f4e39838ef73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ORC unwinder requires libelf to be available on the host, so use
the frame pointer unwinder instead. Using the frame pointer unwinder
is probably good enough in our default Qemu configurations.

Wireless support ends up enabling CONFIG_SYSTEM_TRUSTED_KEYRING, which
requires openssl to be available on the host, so disable wireless
support, which isn't needed in Qemu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/x86_64/linux-4.15.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/qemu/x86_64/linux-4.15.config b/board/qemu/x86_64/linux-4.15.config
index 0e59b87bd6..5fa33d4424 100644
--- a/board/qemu/x86_64/linux-4.15.config
+++ b/board/qemu/x86_64/linux-4.15.config
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
@@ -47,3 +49,4 @@ CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_UNWINDER_FRAME_POINTER=y
