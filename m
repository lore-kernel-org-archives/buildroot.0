From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 07 Aug 2018 12:21:55 +0200
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_2/3_v3=5D_linux=3A_kconfig_n?=
 =?iso-8859-1?q?eeds_host-=7Bflex=2C_bison=7D_to_build_the_configurators?=
In-Reply-To: <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
Message-ID: <f7070a3e-bcd5-4f1f-9897-103a30c8f996@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On p?tek 3. srpna 2018 22:16:55 CEST, Yann E. MORIN wrote:
> Take this opportunity to also drop the append-assignment as the first
> assignment to LINUX_DEPENDENCIES.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> ---
> Changes v2 -> v3:
>   - also fix the append-assignment
> ---
>  linux/linux.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7527b11673..60dad3a249 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -62,7 +62,11 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
>  LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
>  
>  LINUX_INSTALL_IMAGES = YES
> -LINUX_DEPENDENCIES += host-bison host-flex host-kmod
> +LINUX_DEPENDENCIES = host-kmod
> +
> +# Starting with 4.16, the generated kconfig code is no longer
> +# shipped with the kernel sources, so we need flex and bison.
> +LINUX_KCONFIG_DEPENDENCIES = host-bison host-flex
>  
>  # host tools needed for kernel compression
>  ifeq ($(BR2_LINUX_KERNEL_LZ4),y)

Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
