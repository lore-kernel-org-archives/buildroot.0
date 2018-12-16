From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 11:58:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/meson: fix cpu_family format
In-Reply-To: <87pnu1an4d.fsf@tkos.co.il>
References: <1544944395-2049-1-git-send-email-james.hilliard1@gmail.com>
 <87tvjdapl8.fsf@tkos.co.il>
 <CADvTj4o_UCq4xBgE9A_S+zN2uVduiCwmRxZ3BUBGeeOKROAmAQ@mail.gmail.com>
 <87pnu1an4d.fsf@tkos.co.il>
Message-ID: <20181216115841.0708cd69@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Dec 2018 10:31:46 +0200, Baruch Siach wrote:

> So it seems:
> 
> git grep 'select BR2_ARCH_IS_64' -- arch/
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in: select BR2_ARCH_IS_64
> arch/Config.in.riscv:   select BR2_ARCH_IS_64

All other architectures have separate top-level options for their
32-bit and 64-bit variants. I.e i386 vs x86-64, arm vs. arm64, mipsel
vs. mipsel64, etc.

For RISC-V, since the kernel supports both 32-bit and 64-bit as a
single architecture, we decided to do the same in Buildroot, and have a
single top-level BR2_riscv option.

> Not sure what the reason for that is. riscv is also special in that
> there is no support for its 32bit variant in Buildroot.

Mark has already sent patches adding support for RISC-V 32-bit, they
are in patchwork, waiting for testing/review/merge.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
