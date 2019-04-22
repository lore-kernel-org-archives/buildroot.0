From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:08:29 +0200
Subject: [Buildroot] [PATCH 5/5] configs/qemu_ppc_virtex_ml507: kernel build
 needs mkimage
In-Reply-To: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190422200830.2831-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
LINUX_BUILD_CMDS"), the Linux kernel build for
qemu_ppc_virtex_ml507_defconfig builds an image format that needs
mkimage.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339544

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
-- 
2.20.1
