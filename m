From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 1 Apr 2018 10:43:32 -0300
Subject: [Buildroot] [PATCH] toolchain-wrapper: use -ffp-contract=off on
 MIPS Xburst for gcc >= 4.6
In-Reply-To: <20180331175420.19860-1-thomas.petazzoni@bootlin.com>
References: <20180331175420.19860-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAAEAJfAUMNEwjq-YxZkCm_DJSqmvTree10nrb60uojP0QxJkKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31 March 2018 at 14:54, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> From: Waldemar Brodkorb <wbx@openadk.org>
>
> Since gcc 4.6, GCC deprecated -mfused-madd, -ffp-contract=off should
> be used for the Xburst workaround.
>
> Tested with the MIPS Sourcery 2011.03 toolchain (based on gcc 4.5),
> the toolchain wrapper uses -mno-fused-madd, as expected:
>
> $ BR2_DEBUG_WRAPPER=2 ./output/host/bin/mips-linux-gnu-gcc -o toto toto.c
> Toolchain wrapper executing:
>     '/home/thomas/toolchains/mips-2011.03/bin/mips-linux-gnu-gcc'
>     '--sysroot'
>     '/home/thomas/projets/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot'
>     '-mabi=32'
>     '-msoft-float'
>     '-mno-fused-madd'
>     '-EL'
>     '-march=mips32r2'
>     '-o'
>     'toto'
>     'toto.c'
>
> And with the MIPS Sourcery 2012.09 toolchain (based on gcc 4.7), the
> toolchain wrapper uses -ffp-contract=off, as expected:
>
> $ BR2_DEBUG_WRAPPER=2 ./output/host/bin/mips-linux-gnu-gcc -o toto toto.c
> Toolchain wrapper executing:
>     '/home/thomas/toolchains/mips-2012.09/bin/mips-linux-gnu-gcc'
>     '--sysroot'
>     '/home/thomas/projets/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot'
>     '-mabi=32'
>     '-msoft-float'
>     '-ffp-contract=off'
>     '-EL'
>     '-march=mips32r2'
>     '-o'
>     'toto'
>     'toto.c'
>
> Fixes the ci20_defconfig build:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/60303132
>

Fixed that one, but U-Boot fails to build here. I'll submit a patch.

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> [Thomas: rework to continue supporting pre-gcc-4.6 toolchains, extend
> the commit log after doing more testing.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Eze
