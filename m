From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:15:33 +0200
Subject: [Buildroot] [PATCH v2 1/3] qemu_mips32r6: Do not include hi and
 lo in clobber list for R6
In-Reply-To: <20200725220641.1370957-1-romain.naour@gmail.com>
References: <20200725220641.1370957-1-romain.naour@gmail.com>
Message-ID: <20200805231533.3e75099c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Jul 2020 00:06:39 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From [1]
> "GCC 10 (PR 91233) won't silently allow registers that are not architecturally
> available to be present in the clobber list anymore, resulting in build failure
> for mips*r6 targets in form of:
> ...
> .../sysdep.h:146:2: error: the register ?lo? cannot be clobbered in ?asm? for the current target
>   146 |  __asm__ volatile (	 \
>       |  ^~~~~~~
> 
> This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
> This patch provides the alternative clobber list for r6 targets that won't include
> those registers."
> 
> Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
> for mips r6 cpus with gcc 10 for the same reason as glibc.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/655618359
> https://gitlab.com/kubu93/buildroot/-/jobs/655618360
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: use MIPS_ISA_REV instead of __mips_isa_rev
> ---
>  ...ude-hi-and-lo-in-clobber-list-for-R6.patch | 149 ++++++++++++++++++
>  ...ude-hi-and-lo-in-clobber-list-for-R6.patch | 149 ++++++++++++++++++
>  configs/qemu_mips32r6_malta_defconfig         |   1 +
>  configs/qemu_mips32r6el_malta_defconfig       |   1 +
>  4 files changed, 300 insertions(+)
>  create mode 100644 board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
>  create mode 100644 board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch

Thanks, I've applied the entire series, with slightly reworked commit
titles.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
