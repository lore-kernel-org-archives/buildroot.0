From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:31:33 +0100
Subject: [Buildroot] [PATCH]
 support/config-fragments/autobuild/bootlin-x86-64-glibc: use
 toolchain-external-bootlin
In-Reply-To: <20210114224309.457805-1-thomas.petazzoni@bootlin.com>
References: <20210114224309.457805-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210117093133.GB2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-14 23:43 +0100, Thomas Petazzoni spake thusly:
> Until now the bootlin-x86-64-glibc was using a Bootlin toolchain as a
> custom external toolchain. However, now that we have the
> toolchain-external-bootlin package explicitly supporting Bootlin
> toolchains as known toolchain profiles, it makes sense to use
> that. Indeed, this will ensure that this autobuilder configuration
> will use the latest available version of the Buildroot toolchain for
> x86-64 glibc.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../autobuild/bootlin-x86-64-glibc.config          | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/bootlin-x86-64-glibc.config b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
> index 6a372803b2..815eb658e0 100644
> --- a/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
> +++ b/support/config-fragments/autobuild/bootlin-x86-64-glibc.config
> @@ -1,15 +1,5 @@
>  BR2_x86_64=y
>  BR2_x86_corei7=y
>  BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2020.02-2.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
> -# BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> -BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
> -BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
> -BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
> -BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
