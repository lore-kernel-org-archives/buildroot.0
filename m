From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 15:24:35 +0100
Subject: [Buildroot] [PATCH] configs/qemu_aarch64_virt: needs host-openssl
 for the Linux kernel build
Message-ID: <20180324142435.10768-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/59015465

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_aarch64_virt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 3bafd90e5a..076773302d 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.15.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.14.3
