From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:39:16 +0200
Subject: [Buildroot] [PATCH] package/uclibc: reenable riscv64
In-Reply-To: <20200908145346.198693-1-petr.vorel@gmail.com>
References: <20200908145346.198693-1-petr.vorel@gmail.com>
Message-ID: <20201006233916.4365cd35@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Sep 2020 16:53:46 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Missing __riscv_flush_icache() (reason for the revert) was implemented
> in 1.0.35 in commit 8b1f6b2e0 "riscv64: add __riscv_flush_icache".
> 
> Revert "Revert "toolchain/toolchain-buildroot: enable uclibc for riscv64""
> This reverts commit e7d631c0df1698b4edc94f148e7247869430e108.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/uclibc/Config.in                |  1 +
>  toolchain/toolchain-buildroot/Config.in | 13 +++++++------
>  2 files changed, 8 insertions(+), 6 deletions(-)

Thanks, but there was another patch from Damien Le Moal, which also
enabled it for RISC-V 32-bit, so I've applied his patch instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
