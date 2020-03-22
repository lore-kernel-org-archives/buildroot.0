From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 17:01:15 +0100
Subject: [Buildroot] [PATCH] configs/qemu_riscv{32,
 64}_virt_defconfig: Remove BR2_TARGET_GENERIC_GETTY_PORT
In-Reply-To: <8db0057c-b6a4-97ad-9446-c6a6aed558f3@gmail.com>
References: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
 <8db0057c-b6a4-97ad-9446-c6a6aed558f3@gmail.com>
Message-ID: <20200322160115.GH2364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Bin, All,

On 2020-03-22 16:52 +0100, Romain Naour spake thusly:
> Le 07/03/2020 ? 13:20, Bin Meng a ?crit?:
> > Currently BR2_TARGET_GENERIC_GETTY_PORT is set to ttyS0 in both
> > qemu_riscv32_virt and qemu_riscv64_virt defconfig files. This
> > limits usecases when the same one rootfs could be used on QEMU
> > 'sifive_u' machine and SiFive HiFive Unleashed board.
> > 
> > Remove it so that the default boot console can be used.
> 
> By doing this change, we need to check if -nographic is used to start qemu (so
> the serial port is the default console) or if console=ttyS0 is used in the
> kernel command line.
> 
> riscv32 and risc64 are both using -nographic to start Qemu.
> 
> Your use case is similar to the one from [1]
> 
> [1]
> https://git.buildroot.net/buildroot/commit/?id=131300e6f1d0745a1455d246684550e6ecb68549
> 
> Reviewed-by: Romain Naour <romain.naour@gmail.com>

Thanks Romain for this review (and for bringing me in!)

However, I disagree: these defconfig files are for qemu, not the real
hardware.

Additionally, we do have a configuration for the hifive unleashed board
already, hifive_unleashed_defconfig, which is what should be used for
the real hardware.

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> 
> > 
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> > 
> >  configs/qemu_riscv32_virt_defconfig | 1 -
> >  configs/qemu_riscv64_virt_defconfig | 1 -
> >  2 files changed, 2 deletions(-)
> > 
> > diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> > index 914eada..093d888 100644
> > --- a/configs/qemu_riscv32_virt_defconfig
> > +++ b/configs/qemu_riscv32_virt_defconfig
> > @@ -5,7 +5,6 @@ BR2_RISCV_32=y
> >  # System
> >  BR2_SYSTEM_DHCP="eth0"
> >  BR2_TARGET_GENERIC_GETTY=y
> > -BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> >  BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"
> >  
> >  # Filesystem
> > diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
> > index 5c52f7a..54390fc 100644
> > --- a/configs/qemu_riscv64_virt_defconfig
> > +++ b/configs/qemu_riscv64_virt_defconfig
> > @@ -5,7 +5,6 @@ BR2_RISCV_64=y
> >  # System
> >  BR2_SYSTEM_DHCP="eth0"
> >  BR2_TARGET_GENERIC_GETTY=y
> > -BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> >  
> >  # Filesystem
> >  BR2_TARGET_ROOTFS_EXT2=y
> > 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
