From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:58:22 +0200
Subject: [Buildroot] [PATCH] package/musl: bump to version 1.1.24
In-Reply-To: <20191014191305.360663-1-joerg.krause@embedded.rocks>
References: <20191014191305.360663-1-joerg.krause@embedded.rocks>
Message-ID: <20191014225822.507fbaf6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 21:13:05 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> News from upstream [1]:
> """
> This version adds the GLOB_TILDE extension for glob, a non-stub
> implementation of the catgets localization API, and posix_spawn
> extensions for chdir in the child. Many arch-specific bugs are fixed,
> some serious, including CVE-2019-14697 affecting several math
> functions only on i386, broken riscv64 atomics, broken lseek with
> large offsets on x32 and mipsn32, and broken setjmp/longjmp on mipsr6.
> Various low-severity, non-arch-specific bugs are also fixed.
> 
> In addition, this release cycle sets the internal groundwork for
> moving 32-bit archs to 64-bit time_t, needed for their future
> viability as Y2038 approaches. Most of the changes are not externally
> visible, but some affect which syscalls are used. Notably, mips64
> stat-family functions can now report 64-bit file timestamps correctly,
> and some time-related breakage on x32 is fixed. In addition, select no
> longer stores remaining time back to the timeout argument. Previously,
> whether it did so was arch-dependent and merely a consequence of the
> Linux syscall behavior, which was found to be mildly non-conforming.
> """
> 
> Remove patches 0002 to 0005, which are included in the new version.
> Note, that the CVE fix mentioned above is the same as patch 0004.
> 
> The license file has changed because Arm was added to the copyright
> file.
> 
> [1] https://www.musl-libc.org/download.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...-risc64-conflict-with-kernel-headers.patch |  61 ------
>  ...-remove-riscv64-bits-user.h-contents.patch |  69 ------
>  ...balance-in-corner-cases-of-i386-math.patch | 200 ------------------
>  ...ression-in-i386-asm-for-atan2-atan2f.patch |  37 ----
>  package/musl/musl.hash                        |   6 +-
>  package/musl/musl.mk                          |   2 +-
>  6 files changed, 4 insertions(+), 371 deletions(-)
>  delete mode 100644 package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
>  delete mode 100644 package/musl/0003-remove-riscv64-bits-user.h-contents.patch
>  delete mode 100644 package/musl/0004-fix-x87-stack-imbalance-in-corner-cases-of-i386-math.patch
>  delete mode 100644 package/musl/0005-fix-build-regression-in-i386-asm-for-atan2-atan2f.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
