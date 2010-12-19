From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 19 Dec 2010 17:04:05 +0100
Subject: [Buildroot] qemu_ppc_g3beige_defconfig kernel image type (with
	patch)
In-Reply-To: <AANLkTinnVwRMDN91ZYL8bWcJdncpg+qzrpho=X=gNes0@mail.gmail.com>
References: <AANLkTinnVwRMDN91ZYL8bWcJdncpg+qzrpho=X=gNes0@mail.gmail.com>
Message-ID: <AANLkTikMMHpan0BZuLEV2yvc_Wm9twqYWg23heRgNizV@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2010/12/19 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> Hi all,
>
> I'm testing the new qemu_*_defconfig files (brilliant stuff!) but I think I have
> found a bug:
>
> qemu_ppc_g3beige_defconfig defines BR2_LINUX_KERNEL_VMLINUX=y, but after
> configuration the .config file ends up with BR2_LINUX_KERNEL_UIMAGE=y.
>
> According to linux/Config.in it seems like BR2_LINUX_KERNEL_VMLINUX is only
> supported on MIPS. I've attached a patch that changes the kernel format
> from vmlinux to zImage, as uImage is no good with QEMU :-)

I just realized that QEMU handles uImage very well, but I think the
patch is still valid.

Best regards,
Bj?rn Forsman
