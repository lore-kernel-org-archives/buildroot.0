From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:47:03 +0200
Subject: [Buildroot] [git commit] configs/qemu_ppc_virtex_ml507: kernel
 build needs mkimage
Message-ID: <20190424204230.0483F81DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cbf9c63e5abb498ab1863422cb3abc4c7ec7bc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
LINUX_BUILD_CMDS"), the Linux kernel build for
qemu_ppc_virtex_ml507_defconfig builds an image format that needs
mkimage.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339544

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_ppc_virtex_ml507_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index c71465dd56..eddaf3558a 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -21,3 +21,6 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
+
+# Kernel needs mkimage
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
