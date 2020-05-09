From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 12:07:58 +0200
Subject: [Buildroot] [PATCH 2/2] support/config-fragments: add RISC-V
 64-bit uclibc autobuild config
In-Reply-To: <20200508103338.16391-2-mark@dibsco.co.uk>
References: <20200508103338.16391-1-mark@dibsco.co.uk>
 <20200508103338.16391-2-mark@dibsco.co.uk>
Message-ID: <20200509120758.62ede751@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 11:33:38 +0100
Mark Corbin <mark@dibsco.co.uk> wrote:

> Now that RISC-V 64 bit can use uclibc, glibc and musl we can add
> uclibc to the autobuild internal toolchain configurations by
> removing the musl specific config file and adding a generic one.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  ...v64-internal-musl.config => br-riscv64-full-internal.config} | 1 -
>  support/config-fragments/autobuild/toolchain-configs.csv        | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>  rename support/config-fragments/autobuild/{br-riscv64-internal-musl.config => br-riscv64-full-internal.config} (57%)
> 
> diff --git a/support/config-fragments/autobuild/br-riscv64-internal-musl.config b/support/config-fragments/autobuild/br-riscv64-full-internal.config
> similarity index 57%
> rename from support/config-fragments/autobuild/br-riscv64-internal-musl.config
> rename to support/config-fragments/autobuild/br-riscv64-full-internal.config
> index 89e7afb276..c729eb55e9 100644
> --- a/support/config-fragments/autobuild/br-riscv64-internal-musl.config
> +++ b/support/config-fragments/autobuild/br-riscv64-full-internal.config
> @@ -1,3 +1,2 @@
>  BR2_riscv=y
> -BR2_TOOLCHAIN_BUILDROOT_MUSL=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y

This one is not "generic": it will only build a uClibc toolchain. It
seems like you believe that since this defconfig fragment doesn't
mention the C library, it will test glibc, musl and uclibc, but that's
not the case. We do not randomize the choice of the C library, and
since uclibc is our default, this new defconfig file will only test
uclibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
