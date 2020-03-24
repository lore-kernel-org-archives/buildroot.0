From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:19:24 +0100
Subject: [Buildroot] [PATCH] package/gcc: remove version 5.5.5
In-Reply-To: <20200322211540.556085-2-romain.naour@gmail.com>
References: <20200322211540.556085-1-romain.naour@gmail.com>
 <20200322211540.556085-2-romain.naour@gmail.com>
Message-ID: <20200324221924.1f3d5d3c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 22:15:40 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> gcc 9.2 is around, gcc 8.4 is the default version, so drop
> 5.5 in order to reduce the gcc choice.
> 
> GCC 5.5 was disabled for Glibc based toolchain since Glibc
> 2.30 needs GCC 6.2 or later.
> 
> See:
> https://sourceware.org/ml/libc-alpha/2019-08/msg00029.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in.legacy                              |   9 +
>  .../5.5.0/0001-m68k-coldfire-pr68467.patch    |  48 ---
>  ...2-libsanitizer-Use-pre-computed-size.patch |  72 -----
>  package/gcc/5.5.0/100-uclibc-conf.patch       |  15 -
>  ...ix-typo-for-powerpc-e6500-cpu_is_64b.patch |  29 --
>  .../gcc/5.5.0/301-missing-execinfo_h.patch    |  13 -
>  .../gcc/5.5.0/810-arm-softfloat-libgcc.patch  |  30 --
>  .../gcc/5.5.0/830-arm_unbreak_armv4t.patch    |  15 -
>  ...473-Reduce-size-of-Cortex-A8-automat.patch |  68 ----
>  ...0-microblaze-enable-dwarf-eh-support.patch | 166 ----------
>  .../gcc/5.5.0/850-libstdcxx-uclibc-c99.patch  | 273 -----------------
>  package/gcc/5.5.0/860-cilk-wchar.patch        |  56 ----
>  ...870-xtensa-add-mauto-litpools-option.patch | 290 ------------------
>  ...xtensa-reimplement-register-spilling.patch |  76 -----
>  .../874-xtensa-add-uclinux-support.patch      | 174 -----------
>  .../875-xtensa-implement-trap-pattern.patch   |  67 ----
>  .../880-gcc-nios2-Add-IJMP_REGS-enum.patch    | 103 -------
>  package/gcc/5.5.0/890-fix-m68k-compile.patch  |  15 -
>  .../900-libitm-fixes-for-musl-support.patch   |  65 ----
>  ...-fixincludes-update-for-musl-support.patch |  32 --
>  .../gcc/5.5.0/902-unwind-fix-for-musl.patch   |  36 ---
>  ...libgfortran-gthr-workaround-for-musl.patch |  80 -----
>  package/gcc/5.5.0/904-musl-libc-config.patch  | 285 -----------------
>  .../5.5.0/905-add-musl-support-to-gcc.patch   | 130 --------
>  package/gcc/5.5.0/906-mips-musl-support.patch |  37 ---
>  package/gcc/5.5.0/907-x86-musl-support.patch  |  45 ---
>  package/gcc/5.5.0/908-arm-musl-support.patch  |  45 ---
>  .../gcc/5.5.0/909-aarch64-musl-support.patch  |  33 --
>  .../910-microblaze-musl-and-uclibc.patch      |  36 ---
>  package/gcc/5.5.0/911-ppc-musl-support.patch  |  75 -----
>  package/gcc/5.5.0/912-sh-musl-support.patch   |  50 ---
>  ...libgcc-disable-split-stack-nothreads.patch |  14 -
>  .../5.5.0/940-uclinux-enable-threads.patch    |  19 --
>  ...41-mips-Add-support-for-mips-r6-musl.patch |  43 ---
>  package/gcc/Config.in.host                    |  14 -
>  package/gcc/gcc.hash                          |   2 -
>  36 files changed, 9 insertions(+), 2551 deletions(-)
>  delete mode 100644 package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch
>  delete mode 100644 package/gcc/5.5.0/0002-libsanitizer-Use-pre-computed-size.patch
>  delete mode 100644 package/gcc/5.5.0/100-uclibc-conf.patch
>  delete mode 100644 package/gcc/5.5.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
>  delete mode 100644 package/gcc/5.5.0/301-missing-execinfo_h.patch
>  delete mode 100644 package/gcc/5.5.0/810-arm-softfloat-libgcc.patch
>  delete mode 100644 package/gcc/5.5.0/830-arm_unbreak_armv4t.patch
>  delete mode 100644 package/gcc/5.5.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
>  delete mode 100644 package/gcc/5.5.0/840-microblaze-enable-dwarf-eh-support.patch
>  delete mode 100644 package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch
>  delete mode 100644 package/gcc/5.5.0/860-cilk-wchar.patch
>  delete mode 100644 package/gcc/5.5.0/870-xtensa-add-mauto-litpools-option.patch
>  delete mode 100644 package/gcc/5.5.0/871-xtensa-reimplement-register-spilling.patch
>  delete mode 100644 package/gcc/5.5.0/874-xtensa-add-uclinux-support.patch
>  delete mode 100644 package/gcc/5.5.0/875-xtensa-implement-trap-pattern.patch
>  delete mode 100644 package/gcc/5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch
>  delete mode 100644 package/gcc/5.5.0/890-fix-m68k-compile.patch
>  delete mode 100644 package/gcc/5.5.0/900-libitm-fixes-for-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/901-fixincludes-update-for-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/902-unwind-fix-for-musl.patch
>  delete mode 100644 package/gcc/5.5.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
>  delete mode 100644 package/gcc/5.5.0/904-musl-libc-config.patch
>  delete mode 100644 package/gcc/5.5.0/905-add-musl-support-to-gcc.patch
>  delete mode 100644 package/gcc/5.5.0/906-mips-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/907-x86-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/908-arm-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/909-aarch64-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/910-microblaze-musl-and-uclibc.patch
>  delete mode 100644 package/gcc/5.5.0/911-ppc-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/912-sh-musl-support.patch
>  delete mode 100644 package/gcc/5.5.0/930-libgcc-disable-split-stack-nothreads.patch
>  delete mode 100644 package/gcc/5.5.0/940-uclinux-enable-threads.patch
>  delete mode 100644 package/gcc/5.5.0/941-mips-Add-support-for-mips-r6-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
