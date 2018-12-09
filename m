From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:28:51 +0100
Subject: [Buildroot] [git commit] configs/nexbox_a95x: kernel needs
 host-openssl
Message-ID: <20181209162529.16D65882DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c36985b374d9ff47d025c684060ec0534b9ecac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 9f5b07fc64 ("configs: nexbox_a95x_defconfig: bump to
kernel 4.19.8"), the nexbox_a95x_defconfig needs host-openssl to build
the Linux kernel.

Fixes: https://gitlab.com/ymorin/buildroot/-/jobs/131924236

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nexbox_a95x_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 4b0fc9cfba..4820d47d52 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-s905x-nexbox-a95x"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
