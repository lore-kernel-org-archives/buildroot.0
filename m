From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 23:12:54 +0100
Subject: [Buildroot] [git commit] configs: remove integrator926_defconfig
Message-ID: <20151105221428.222E181E89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b56ad1efe8218e8bbd45492868f49d5332f2d8c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the integrator926_defconfig configuration, which has not been
updated since a very long time, and targets hardware that is quite
difficult, not to say impossible, to get.

While Qemu has an emulation for the Integrator CP platform, it doesn't
seem to emulate a hard drive, which makes it not very useful. In
addition, we already have the qemu_arm_versatile_defconfig for an
ARMv5 platform emulated in Qemu.

Therefore, let's get rid of this fairly old and never updated
defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/integrator926_defconfig |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
deleted file mode 100644
index e63f455..0000000
--- a/configs/integrator926_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="integratorcp_cm926ejs"
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="2.6.35"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.35"
-BR2_LINUX_KERNEL_DEFCONFIG="integrator"
-
-# Filesystem
-BR2_TARGET_ROOTFS_TAR=y
