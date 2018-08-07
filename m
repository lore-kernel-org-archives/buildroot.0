From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 07 Aug 2018 12:21:42 +0200
Subject: [Buildroot] [PATCH 3/3 v3] linux: kconfig needs the toolchain
In-Reply-To: <5878b50c7b69951bc528d25c98a691a888ee5051.1533327111.git.yann.morin.1998@free.fr>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <5878b50c7b69951bc528d25c98a691a888ee5051.1533327111.git.yann.morin.1998@free.fr>
Message-ID: <b0c83b84-c80b-4e1d-be77-d9df468efea5@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On p?tek 3. srpna 2018 22:16:56 CEST, Yann E. MORIN wrote:
> Starting with linux-4.18, the kconfig from the kernel can call
> to the compiler to test its capabilities; see:
>
>     
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/Kconfig.include
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> ---
> Changes v1 -> v2:
>   - take advantage of the kconfig-package infra  (Thomas)
> ---
>  linux/linux.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 60dad3a249..48b2a16ce7 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -68,6 +68,11 @@ LINUX_DEPENDENCIES = host-kmod
>  # shipped with the kernel sources, so we need flex and bison.
>  LINUX_KCONFIG_DEPENDENCIES = host-bison host-flex
>  
> +# Starting with 4.18, the kconfig in the kernel calls the
> +# cross-compiler to check its capabilities. So we need the
> +# toolchain before we can call the configurators.
> +LINUX_KCONFIG_DEPENDENCIES += toolchain
> +
>  # host tools needed for kernel compression
>  ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
>  LINUX_DEPENDENCIES += host-lz4

Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
Reviewed-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
