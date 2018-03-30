From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 18:59:38 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 configs/qemu_x86_defconfig: remove kernel options that need openssl
Message-ID: <20180330193201.9B827811AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12c9d22517deacf4f7b7eda723c813c51e4785e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Wireless support ends up enabling CONFIG_SYSTEM_TRUSTED_KEYRING, which
requires openssl to be available on the host, so disable wireless
support, which isn't needed in Qemu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5c5f1b07434a1d17cace941ffcec791f3633b5ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
