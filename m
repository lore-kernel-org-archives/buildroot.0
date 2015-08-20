From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 20 Aug 2015 10:45:25 +1000
Subject: [Buildroot] [PATCH] package/librtas: only show comment on
 supported architectures
In-Reply-To: <1440026414-32186-1-git-send-email-yann.morin.1998@free.fr>
References: <1440026414-32186-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150820004525.GB2363@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 20, 2015 at 01:20:14AM +0200, Yann E. MORIN wrote:
> librtas is only available for PPC and PPC64, so only show the comment
> about the (e)glibc dependency for those archs.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
>  package/librtas/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/librtas/Config.in b/package/librtas/Config.in
> index e437fa1..2e6063f 100644
> --- a/package/librtas/Config.in
> +++ b/package/librtas/Config.in
> @@ -10,4 +10,5 @@ config BR2_PACKAGE_LIBRTAS
>  	  http://librtas.sourceforge.net/
>  
>  comment "librtas needs an (e)glibc toolchain"
> +	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC
> -- 
> 1.9.1

Yann,

Looks good to me :-)

Reviewed-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Thanks,
Sam.
