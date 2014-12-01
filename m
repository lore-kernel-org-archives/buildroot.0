From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Dec 2014 15:37:40 +0000
Subject: [Buildroot] [PATCH] ci20_defconfig: remove
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
Message-ID: <1417448260-23029-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We had this option in the defconfig because the kernel defconfig we
provide doesn't have CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT, so a
/dev management which creates the devices dynamically using only
devtmpfs would not work. However, CONFIG_DEVTMPFS and
CONFIG_DEVTMPFS_MOUNT are automatically added to the kernel config when
you build the kernel using Buildroot, except when you choose
BR2_ROOTFS_DEVICE_CREATION_STATIC as a /dev management. This is handled
by linux/linux.mk.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 configs/ci20_defconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 7f1bf87..a7b7622 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -7,7 +7,6 @@ BR2_mips_32r2=y
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.0.8"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 
 # kernel
-- 
1.7.1
