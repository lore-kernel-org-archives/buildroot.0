From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 11:03:25 +0100
Subject: [Buildroot] [PATCH] package/zlib: zlib-ng only available on
 some archs
In-Reply-To: <20180225221043.7517-1-yann.morin.1998@free.fr>
References: <20180225221043.7517-1-yann.morin.1998@free.fr>
Message-ID: <20180226110325.6182900b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Feb 2018 23:10:43 +0100, Yann E. MORIN wrote:
> Upstream has code only for those architectures, with no fallback generic
> code, so we must restrict zlib-ng to only those four archs...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Note: I was not sure if the big-endian variants for arm and Aarch64 are
> supported or not, so to be safe, we supopse they are not. Interested
> parties can send further patches to improve the situation.
> ---
>  package/zlib/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/zlib/Config.in b/package/zlib/Config.in
> index 87abc2bdd5..40b2e6e0cf 100644
> --- a/package/zlib/Config.in
> +++ b/package/zlib/Config.in
> @@ -1,3 +1,10 @@
> +config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPOPRT

Typo: SUPPORTS

>  config BR2_PACKAGE_ZLIB_NG
>  	bool "zlib-ng"
> +	depends on BR2_PACKAGE_ZLIB_NG_ARCH_SUPPOPRT

The typo was consistent :-)

Applied to master with the typo fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
