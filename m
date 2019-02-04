From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 14:34:29 +0100
Subject: [Buildroot] [PATCH] package/clapack+armadillo: re-enable on MIPS
In-Reply-To: <20190131203906.15410-1-patrickdepinguin@gmail.com>
References: <20190131203906.15410-1-patrickdepinguin@gmail.com>
Message-ID: <20190204143429.1c77d00b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Jan 2019 21:39:06 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Commit d2b52cebf3b8b4a922a54d38a44a8a183406c5f1 disabled clapack on MIPS
> platforms, to fix an autobuild failure (unfortunately, the results are no
> longer available). The argument was:
> 
>     "Disable this package for MIPS because it needs IRIX headers and
>     libraries."
> 
> Nevertheless, today compilation on MIPS seems to work fine. Testing was done
> with test-pkg (armadillo depends on clapack):
> 
> $ echo "BR2_PACKAGE_ARMADILLO=y" > config.snippet;
> $ utils/test-pkg -p armadillo -a -c config.snippet
>                  br-mips32r6-el-hf-glibc [1/8]: OK
>                       br-mips64-n64-full [2/8]: OK
>                  br-mips64r6-el-hf-glibc [3/8]: OK
>                       br-mipsel-o32-full [4/8]: OK
>              mips64el-ctng_n32-linux-gnu [5/8]: OK
>              mips64el-ctng_n64-linux-gnu [6/8]: OK
>                          sourcery-mips64 [7/8]: OK
>                            sourcery-mips [8/8]: OK
> 8 builds, 0 skipped, 0 build failed, 0 legal-info failed
> 
> Manual build tests were also done for mips32r2 with gcc 4.9.x and gcc 7.x,
> and for M5150 with gcc 7.x (Buildroot-built toolchains in these three
> cases).
> 
> Also building and running on Octeon III, using the toolchain provided by
> Cavium Networks / Marvell, works fine.
> 
> Not seeing any problem (but also not understanding the original problem),
> re-enable clapack (and armadillo) on MIPS.  If any problems would pop up in
> the future, they should be investigated in detail and a more fine-grained
> solution should be taken than disabling on MIPS altogether.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/armadillo/Config.in | 2 --
>  package/clapack/Config.in   | 1 -
>  2 files changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
