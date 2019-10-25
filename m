From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 21:43:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsigsegv: fix macro expansion
 error for RISC-V with musl
In-Reply-To: <20191025095605.17673-1-mark.corbin@embecosm.com>
References: <20191025095605.17673-1-mark.corbin@embecosm.com>
Message-ID: <20191025214328.48a8207e@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 10:56:05 +0100
Mark Corbin <mark.corbin@embecosm.com> wrote:

> The expansion of the SIGSEGV_FAULT_STACKPOINTER macro fails when
> building for RISC-V with musl because REG_SP is not defined (it is
> defined for glibc). This patch just replaces REG_SP with the
> numerical register offset (which is 2 for the stack pointer).

REG_SP is defined in musl in:

  https://git.musl-libc.org/cgit/musl/tree/arch/riscv64/bits/reg.h

So I'm not sure I'm following the reasoning here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
