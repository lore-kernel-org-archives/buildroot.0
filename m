From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 23:56:11 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/swupdate: bump to version
 2019.04
In-Reply-To: <1560196536-2565-1-git-send-email-pjtexier@koncepto.io>
References: <1560196536-2565-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <4eb72728-02df-77cd-c030-9727c8ca3b0e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 21:55, Pierre-Jean Texier wrote:
> New features in this release:
>  - Improved documentation
>  - delta updates based on rdiff library
>  - support for libubootenv
>  - dry-run option
>  - CA certificates for signed images
>  - Fix security leak in parser
> 
> This commit also:
>  - introduce BR2_PACKAGE_LIBRSYNC for 'rdiff' Handler
>  - introduce BR2_PACKAGE_LIBUBOOTENV
>  - drop upstreamed patch
>  - backport upstream patches (important fix)
>  - regenerate the default swupdate.config. Now
>    CONFIG_GUNZIP is always enabled because gunzip
>    is provided by the default busybox config.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

 Applied to master with the change mentioned below, thanks.

[snip]
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index ca2eaf2..53f8b09 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -34,6 +34,10 @@ config BR2_PACKAGE_SWUPDATE
>  	    support for setting the U-Boot environment.
>  	  * Select BR2_PACKAGE_ZEROMQ to add support for using a
>  	    remote handler.
> +	  * Select BR2_PACKAGE_LIBRSYNC to add support for using
> +	    rdiff handler.
> +	  * Select BR2_PACKAGE_LIBUBOOTENV and BR2_PACKAGE_ZLIB to add

 ZLIB is seleced by libubootenv, so there's no need to mention it here.

 Regards,
 Arnout

> +	    support for setting the U-Boot environment with the new API.
>  
>  	  https://sbabic.github.io/swupdate
[snip]
