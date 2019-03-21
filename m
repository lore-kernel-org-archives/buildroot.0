From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Mar 2019 17:57:41 +0100
Subject: [Buildroot] [PATCH v5 2/4] boot/opensbi: new package
In-Reply-To: <c96ecd37-86d7-bcc4-f9f4-e2f39b6f4a8d@embecosm.com>
References: <20190320003706.1126-1-alistair.francis@wdc.com>
 <20190320003706.1126-2-alistair.francis@wdc.com>
 <20190320221236.1ea9c11b@windsurf>
 <c96ecd37-86d7-bcc4-f9f4-e2f39b6f4a8d@embecosm.com>
Message-ID: <20190321175741.679d5926@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

Thanks for the heads-up!

On Thu, 21 Mar 2019 16:36:22 +0000
Mark Corbin <mark.corbin@embecosm.com> wrote:

> a) commit 'allow BR2_LINUX_KERNEL_IMAGE on RISC-V'
> (a3a4d4d4d307fd21f19ae43e77ac21b85adad7f2) is causing riscv builds to
> fail for the existing qemu defconfigs because OpenSBI hasn't been added
> yet and riscv-pk expects a 'vmlinux' file.

This one should be fixed by adding:

BR2_LINUX_KERNEL_VMLINUX=y

in the defconfig.

> b) commit 'configs/qemu_riscv32_virt: upgrade to 4.20 kernel'
> (e92d5624236e47e1abe44f2ace24fceb1882c0a5) results in a kernel that
> won't boot with QEMU due to lack of OpenSBI and/or required kernel
> configuration updates.

Which configuration updates are needed ? The ones that Alistair was
pushing ? If they were need for the 4.20 bump to work, then they should
have been part of the same commit :-/

Anyway, Alistair has been respinning his series very frequently, so I
assume we can get the remainder of the work merged very soon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
