From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:10:09 +0100
Subject: [Buildroot] [PATCH] package/php: select SYSTEMD_TMPFILES for
 PHP_SAPI_FPM
In-Reply-To: <20191122093930.7933-1-p.debruijn@unilogic.nl>
References: <20191122093930.7933-1-p.debruijn@unilogic.nl>
Message-ID: <20191125221009.4c31d0d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?my,

Do you have some feedback about this patch ?

Thanks,

Thomas

On Fri, 22 Nov 2019 10:39:30 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> PrivateTmp=true requires SYSTEMD_TMPFILES otherwise the service will
> fail to start on boot.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/php/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/php/Config.in b/package/php/Config.in
> index 2469573..b65438a 100644
> --- a/package/php/Config.in
> +++ b/package/php/Config.in
> @@ -39,6 +39,7 @@ config BR2_PACKAGE_PHP_SAPI_CLI
>  
>  config BR2_PACKAGE_PHP_SAPI_FPM
>  	bool "FPM interface"
> +	select BR2_PACKAGE_SYSTEMD_TMPFILES if BR2_PACKAGE_SYSTEMD
>  	depends on BR2_USE_MMU
>  	# "Sparc v8 and predecessors are not and will not be supported"
>  	depends on !BR2_sparc



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
