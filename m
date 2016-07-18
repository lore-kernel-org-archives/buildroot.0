From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:10:29 +0200
Subject: [Buildroot] [PATCH v2] uboot-tools: fix conditional build of
 FIT support
In-Reply-To: <20160718000708.26051-1-ricardo.martincoski@gmail.com>
References: <20160717193603.13671-1-ricardo.martincoski@gmail.com>
 <20160718000708.26051-1-ricardo.martincoski@gmail.com>
Message-ID: <20160718231029.171a06cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 21:07:08 -0300, Ricardo Martincoski wrote:
> The removal of the unconditional compilation and linking of some .o files were
> missed when porting the patch 0003 to the version 2016.07, leading to errors
> like these when FIT support is enabled:
> 
> tools/fit_common.o: In function `fit_verify_header':
> fit_common.c:(.text+0x0): multiple definition of `fit_verify_header'
> tools/fit_common.o:fit_common.c:(.text+0x0): first defined here
> tools/fit_common.o: In function `fit_check_image_types':
> fit_common.c:(.text+0x10): multiple definition of `fit_check_image_types'
> 
> When FIT support is disabled, the build does not fail but it includes FIT
> support.
> 
> Fix the patch 0003 to be equivalent to the original one.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7494a5b22e3df1c05cdcc47670deaf54d9e04133
> http://autobuild.buildroot.net/results/f98f30bbf9d4cdde37a96b9310873d83dd649c54
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: Carlos Santos <casantos@datacom.ind.br>
> ---
> Changes v1 -> v2:
>  - add reference to autobuild failures, as I just noticed the error was caught
>  - clarify a bit the error on the commit log, and also in the patch header
>   - the build failure occurs when FIT support is enabled
>   - when it is disabled the build includes FIT support but does not fail
>   - compilation is also conditional in the original patch, not just linking
>  - fix typo on commit log
>  - git format-patch -U4 when sending to the list to make this review easier

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
