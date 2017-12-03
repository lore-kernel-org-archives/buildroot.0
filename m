From: Dagg Stompler <daggs@gmx.com>
Date: Sun,  3 Dec 2017 14:56:13 +0200
Subject: [Buildroot] [PATCH 2/8] odroidc2: add boot.cmd for mainline uboot.
In-Reply-To: <20171203125619.30919-1-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
Message-ID: <20171203125619.30919-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add support of boot.cmd for mainline uboot

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/boot.cmd | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 board/hardkernel/odroidc2/boot.cmd

diff --git a/board/hardkernel/odroidc2/boot.cmd b/board/hardkernel/odroidc2/boot.cmd
new file mode 100644
index 0000000000..85a1a0a020
--- /dev/null
+++ b/board/hardkernel/odroidc2/boot.cmd
@@ -0,0 +1,10 @@
+setenv loadaddr "0x1080000"
+setenv dtb_loadaddr "0x01000000"
+setenv kernel_filename "uImage"
+setenv fdt_filename "meson-gxbb-odroidc2.dtb"
+setenv bootargs "console=ttyAML0,115200n8 earlyprintk root=/dev/mmcblk1p2 rootwait panic=10 ${extra} rw"
+
+fatload mmc 0:1 ${loadaddr} ${kernel_filename}
+fatload mmc 0:1 ${dtb_loadaddr} ${fdt_filename}
+
+bootm ${loadaddr} - ${dtb_loadaddr}
-- 
2.15.1
