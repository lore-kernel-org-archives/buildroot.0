From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 17:49:01 +0200
Subject: [Buildroot] [git commit] configs: lock kernel version for
	atngw100_defconfig
Message-ID: <20130807154846.859D89B230@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae6130953d68406611c5459c513b0d78dfc2f40e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 3.10.x kernels fail to build with the following message:

vsprintf.c:(.text+0x17e0): relocation truncated to fit: R_AVR32_16N_PCREL against symbol `_ctype' defined in .text section in lib/lib.a(ctype.o)

While this is most likely a toolchain issue, but since AVR32 isn't a
well-maintained architecture, there's not much we can do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atngw100_defconfig |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 4a779e1..4928915 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -1,6 +1,10 @@
 # Architecture
 BR2_avr32=y
 
+# Lock down kernel headers version, to match the kernel version used
+# below.
+BR2_KERNEL_HEADERS_3_9=y
+
 # Filesystems
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
@@ -17,6 +21,10 @@ BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.09"
 
-# Kernel
+# Kernel. Locked to 3.9.x, because 3.10.x fails to build with
+# relocation truncated to fit: R_AVR32_16N_PCREL against symbol
+# `_ctype'
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.11"
 BR2_LINUX_KERNEL_DEFCONFIG="atngw100"
