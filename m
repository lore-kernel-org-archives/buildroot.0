From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:51:44 +0200
Subject: [Buildroot] [git commit] board/qemu/aarch64-virt/linux.config: add
 RTC PL031 driver
Message-ID: <20200711135056.1FC3C81763@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3bf3399079e4a69b4ef1f22b044ce7358ff0de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qemu for the aarch64 virt emulate an RTC PL031 device.
Enable the kernel support to allow setting the system time.

"date" now return the current time:
Sun Jul  5 20:38:50 UTC 2020

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-virt/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index 948b06b0a2..49018efe95 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -45,6 +45,7 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_MAILBOX=y
