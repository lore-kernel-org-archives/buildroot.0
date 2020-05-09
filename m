From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:56:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pigz: fix zlib dependency on
 host-pigz
In-Reply-To: <20200504094236.1113-1-lpdev@cordier.org>
References: <20200504094236.1113-1-lpdev@cordier.org>
Message-ID: <20200509225601.2c38e964@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 11:42:36 +0200
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
> ---
>  package/pigz/Config.in      | 1 -
>  package/pigz/Config.in.host | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pigz/Config.in b/package/pigz/Config.in
> index a76146d8fc..af229060cf 100644
> --- a/package/pigz/Config.in
> +++ b/package/pigz/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PIGZ
>  	bool "pigz"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_ZLIB
> -	select BR2_PACKAGE_HOST_ZLIB

This was indeed wrong.

>  	help
>  	  pigz, which stands for parallel implementation of gzip, is a
>  	  fully functional replacement for gzip that exploits multiple
> diff --git a/package/pigz/Config.in.host b/package/pigz/Config.in.host
> index 9903cada7d..3e3e5ac656 100644
> --- a/package/pigz/Config.in.host
> +++ b/package/pigz/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_PIGZ
>  	bool "host pigz"
> +	select BR2_PACKAGE_HOST_ZLIB

But this is also wrong. BR2_PACKAGE_HOST_ZLIB does not exist at all. So
I dropped this part of your patch, and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
