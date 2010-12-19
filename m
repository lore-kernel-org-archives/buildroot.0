From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 19 Dec 2010 16:42:35 +0100
Subject: [Buildroot] qemu_ppc_g3beige_defconfig kernel image type (with
	patch)
Message-ID: <AANLkTinnVwRMDN91ZYL8bWcJdncpg+qzrpho=X=gNes0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm testing the new qemu_*_defconfig files (brilliant stuff!) but I think I have
found a bug:

qemu_ppc_g3beige_defconfig defines BR2_LINUX_KERNEL_VMLINUX=y, but after
configuration the .config file ends up with BR2_LINUX_KERNEL_UIMAGE=y.

According to linux/Config.in it seems like BR2_LINUX_KERNEL_VMLINUX is only
supported on MIPS. I've attached a patch that changes the kernel format
from vmlinux to zImage, as uImage is no good with QEMU :-)

Best regards,
Bj?rn Forsman
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-qemu_ppc_g3beige_defconfig-fix-kernel-image-format.patch
Type: text/x-diff
Size: 1259 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101219/f6348440/attachment.bin>
