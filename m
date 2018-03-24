From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Mar 2018 16:48:33 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain-configs.csv: re-organize
 for test-pkg
In-Reply-To: <20180323214815.19831-2-thomas.petazzoni@bootlin.com>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
 <20180323214815.19831-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180324154833.GD2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-23 22:48 +0100, Thomas Petazzoni spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit reorganizes the toolchain-configs.csv so that the first
> toolchains are a subset of "useful" toolchains to be tested by
> contributors to validate a package. This subset is the one that will
> be used by default by test-pkg.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes since v1:
> - Add better comments to explain the two "sections" of the toolchain
>   list, as suggested by Yann E. Morin.
> ---
>  .../autobuild/toolchain-configs.csv                | 32 ++++++++++++++++++----
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index 2010113f44..1bce7ac577 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -1,20 +1,41 @@
> +# This file is sorted by "importance" of toolchains, so that by
> +# default test-pkg tests a useful subset of toolchains
> +
> +# Toolchains used by default by test-pkg:
> +
> +# Test a regular uClibc toolchain
> +support/config-fragments/autobuild/br-arm-full.config,x86_64
> +
> +# Test a toolchain with glibc and a very recent gcc version
> +support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
> +
> +# Test a noMMU toolchain with no dynamic library support
> +support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
> +
> +# Test a musl toolchain
> +support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
> +
> +# Test a noMMU toolchain with dynamic library support
> +support/config-fragments/autobuild/br-bfin-full.config,x86_64
> +
> +# Test a MMU toolchain without dynamic library support
> +support/config-fragments/autobuild/br-arm-full-static.config,x86_64
> +
> +# Test a toolchain with an old gcc version (gcc 4.8)
>  support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config,x86
> +
> +# Toolchains used by test-pkg only when the '-a' option is passed:
>  support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config,x86
>  support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
>  support/config-fragments/autobuild/br-arc-full-internal.config,any
>  support/config-fragments/autobuild/br-arc-internal-glibc.config,any
>  support/config-fragments/autobuild/br-arcle-hs38.config,x86_64
>  support/config-fragments/autobuild/br-arm-basic.config,x86_64
> -support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config,x86_64
>  support/config-fragments/autobuild/br-arm-cortex-a9-musl.config,x86_64
> -support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
> -support/config-fragments/autobuild/br-arm-full.config,x86_64
>  support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
> -support/config-fragments/autobuild/br-arm-full-static.config,x86_64
>  support/config-fragments/autobuild/br-arm-internal-full.config,any
>  support/config-fragments/autobuild/br-arm-internal-glibc.config,any
>  support/config-fragments/autobuild/br-arm-internal-musl.config,any
> -support/config-fragments/autobuild/br-bfin-full.config,x86_64
>  support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
>  support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config,x86_64
>  support/config-fragments/autobuild/br-m68k-5208-full.config,x86_64
> @@ -36,7 +57,6 @@ support/config-fragments/autobuild/br-sh4-full.config,x86_64
>  support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
>  support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
>  support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
> -support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
>  support/config-fragments/autobuild/br-xtensa-full.config,x86_64
>  support/config-fragments/autobuild/br-xtensa-full-internal.config,any
>  support/config-fragments/autobuild/i686-ctng-linux-gnu.config,x86
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
