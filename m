From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:13:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: add FFI support
In-Reply-To: <20200728163125.2489208-1-tom.marcuzzi@orolia.com>
References: <20200728163125.2489208-1-tom.marcuzzi@orolia.com>
Message-ID: <20200805231301.3991036b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tom,

On Tue, 28 Jul 2020 18:31:25 +0200
Tom Marcuzzi <tom.marcuzzi@orolia.com> wrote:

> Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
> ---
>  package/php/Config.ext | 6 ++++++
>  package/php/php.mk     | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index b0ab2c9ec7..f8beb25afb 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -427,4 +427,10 @@ config BR2_PACKAGE_PHP_EXT_XSL
>  	help
>  	  XSL transformation support
>  
> +config BR2_PACKAGE_PHP_EXT_FFI
> +	bool "FFI"
> +	select BR2_PACKAGE_LIBFFI

You had forgotten to replicate the "depends on
BR2_TOOLCHAIN_HAS_THREADS" from BR2_PACKAGE_LIBFFI. So I did that and
applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
