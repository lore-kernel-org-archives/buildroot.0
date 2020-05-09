From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 16:58:18 +0200
Subject: [Buildroot] [PATCH] package/gcc: remove powerpc conditional
 patch
In-Reply-To: <20200508083433.1313246-1-romain.naour@gmail.com>
References: <20200508083433.1313246-1-romain.naour@gmail.com>
Message-ID: <20200509165818.46e1e43c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 10:34:33 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> We lost track the powerpc conditional patch that was added for gcc 4.3.3 [1]
> and present up to gcc 4.9 (gcc 4.9 removed by [2]). But the code in gcc.mk
> is still present.
> 
> The patch was dropped starting gcc 5.1 [3] but it's know to be useful for
> gcc 4.7.3 [4].
> 
> Since we used to have a patch directory (package/gcc/$(GCC_VERSION)) for
> every gcc version available in Buildroot, the apply-patches.sh script
> doesn't error out even if 1000-powerpc-link-with-math-lib.patch.conditional
> is missing.
> 
> But with gcc 10, we don't need (for the moment) to apply any patch, so the
> patch directory doesn't exist. apply-patches.sh break the build since
> the patch directory is missing:
> 
>   Aborting.  'package/gcc/10.1.0' is not a directory.
> 
> Since we removed gcc 4.9 last year [2], we can safely remove this code.
> 
> Tested using qemu_ppc_virtex_ml507_defconfig.
> 
> [1] bb1f42e4426c432af60fc80da45c6daf7e31c1a0
> [2] baf177502214a67619d9d0d6d0a780458e4d652d
> [3] 4deb2d93c5ab317b6addf4e1e132571ba8dac031
> [4] 197006a41c1a0450bf6350d5742e186b5b0c69de
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gcc/gcc.mk | 8 --------
>  1 file changed, 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
