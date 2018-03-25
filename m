From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 23:21:56 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: fix detection of SSP support
In-Reply-To: <20180325035953.25906-2-casantos@datacom.ind.br>
References: <20180325035953.25906-1-casantos@datacom.ind.br>
 <20180325035953.25906-2-casantos@datacom.ind.br>
Message-ID: <20180325232156.1716cb0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Mar 2018 00:59:52 -0300, Carlos Santos wrote:
> GCC issues a warning message if -fstack-protector is passed but SSP is
> not available, so in order to force the compilation to fail we must also
> pass -Werror.
> 
> All external toolchains were verified. The only one whose configuration
> incorrectly selected BR2_TOOLCHAIN_HAS_SSP was CodeSourcery NIOSII.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/ce8fe8ac9cf0db01ae15d476ea714ff176965cfb
>   http://autobuild.buildroot.net/results/09ce8f05e28c0219f499ce55130e896cae0c8b45
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  toolchain/helpers.mk                                                    | 2 +-
>  .../toolchain-external/toolchain-external-codesourcery-niosII/Config.in | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
