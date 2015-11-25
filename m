From: Guillaume Delbergue <guillaume.delbergue@greensocs.com>
Date: Wed, 25 Nov 2015 14:19:59 +0100
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add DTB support for ARM
	Versatile PB
Message-ID: <1448457599-29371-1-git-send-email-guillaume.delbergue@greensocs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, without this option, you can't boot
ARM Versatile PB with a DTB on QEMU. You get the
following error (using earlyprintk):

Uncompressing Linux... done, booting the kernel.

Error: unrecognized/unsupported device tree compatible list:
[ 'arm,versatile-pb' ]

Available machine support:

ID (hex)	NAME
00000183	ARM-Versatile PB
0000025e	ARM-Versatile AB

Please check your kernel config and/or bootloader.

Add CONFIG_MACH_VERSATILE_DT to support Versatile platform from device tree

Signed-off-by: Guillaume Delbergue <guillaume.delbergue@greensocs.com>
---
 board/qemu/arm-versatile/linux-4.3.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/arm-versatile/linux-4.3.config b/board/qemu/arm-versatile/linux-4.3.config
index 9a1ae58..99df3a6 100644
--- a/board/qemu/arm-versatile/linux-4.3.config
+++ b/board/qemu/arm-versatile/linux-4.3.config
@@ -3,6 +3,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_ARCH_VERSATILE=y
 CONFIG_MACH_VERSATILE_AB=y
+CONFIG_MACH_VERSATILE_DT=y
 CONFIG_PCI=y
 CONFIG_AEABI=y
 CONFIG_USE_OF=y
-- 
2.4.9 (Apple Git-60)
