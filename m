From: Enoch W. <ixew@hotmail.com>
Date: Sun, 2 Sep 2018 21:04:32 +0000
Subject: [Buildroot] patch buildroot/package/dtc
Message-ID: <CO2PR01MB1976EB656E93F73EA89B8FFECC0D0@CO2PR01MB1976.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Linux 14.4 kernel has its own libfdt_env.h, grep:
beagleboard/linux/scripts/dtc/libfdt/fdt.c:#include "libfdt_env.h"

We need to reject the almost identical file from the host tools, find:
output/host/include/libfdt_env.h

Or otherwise have fdt16_to_cpu etc. redefinition errors.

The fix is trivial.

Thanks, Enoch.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Linux-14.4-kernel-has-libfdt_env.h-of-its-own.patch
Type: text/x-patch
Size: 644 bytes
Desc: 0001-Linux-14.4-kernel-has-libfdt_env.h-of-its-own.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180902/2deddfdc/attachment.bin>
