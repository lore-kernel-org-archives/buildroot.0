From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  6 Nov 2014 19:18:25 +0300
Subject: [Buildroot] [PATCH 2/2] board: add support for ARC AXS103 Software
	Development Platform
In-Reply-To: <1415290705-994-1-git-send-email-abrodkin@synopsys.com>
References: <1415290705-994-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1415290705-994-3-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AXS103 Platform consists of a DesignWare AXC003 CPU
Card (typically with ARC HS38 core) mounted on an
ARC Software Development Platform Mainboard with DesignWare peripherals:
 * SD/MMC contoller
 * Gigabit network contoller
 * Serial ports (8250-compatible)
 * USB 2.0
 * SPI
 * I2C

It also houses HDMI output for extrenal monitor connection.

As of today Linux kernel sources are not published for ARC HS core so
kernel could be built from custom tarball with sources if required.

When kernel sources for ARC HS are released this configuration will be updated.

But even now rootfs image could be built with Buildroot for ARC HS since
gcc, binutils and uClibc for ARC already has support of the new core starting
from version "arc-2014.08".

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 configs/axs103_defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 configs/axs103_defconfig

diff --git a/configs/axs103_defconfig b/configs/axs103_defconfig
new file mode 100644
index 0000000..5be8fad
--- /dev/null
+++ b/configs/axs103_defconfig
@@ -0,0 +1,9 @@
+BR2_arcle=y
+BR2_archs38=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS3"
+BR2_PACKAGE_LMBENCH=y
+BR2_PACKAGE_LTP_TESTSUITE=y
+BR2_TARGET_ROOTFS_CPIO=y
-- 
1.9.3
