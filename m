From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  7 Jul 2020 01:41:45 +0200
Subject: [Buildroot] [PATCH 2/8] board/qemu/aarch64-virt/linux.config: add
 RTC PL031 driver
In-Reply-To: <20200706234151.2940865-1-romain.naour@gmail.com>
References: <20200706234151.2940865-1-romain.naour@gmail.com>
Message-ID: <20200706234151.2940865-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qemu for the aarch64 virt emulate an RTC PL031 device.
Enable the kernel support to allow setting the system time.

"date" now return the current time:
Sun Jul  5 20:38:50 UTC 2020

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.4
