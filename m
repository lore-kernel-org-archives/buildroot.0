From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:08:27 +0200
Subject: [Buildroot] [PATCH 3/5] configs/qemu_nios2_10m50: kernel build
 needs mkimage
In-Reply-To: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190422200830.2831-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
LINUX_BUILD_CMDS"), the Linux kernel build for
qemu_nios2_10m50_defconfig builds an image format that needs mkimage.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339537

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_nios2_10m50_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index d7e7c335a3..c07abc3715 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -8,3 +8,6 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+# Kernel needs mkimage
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.20.1
