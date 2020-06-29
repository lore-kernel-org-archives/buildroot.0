From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 23:19:35 +0200
Subject: [Buildroot] [PATCH 3/4] package/poco: enable build for riscv64
In-Reply-To: <20200629210735.179913-3-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
 <20200629210735.179913-3-juju@cotds.org>
Message-ID: <20200629231935.17662626@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Jun 2020 23:07:34 +0200
Julien Olivain <juju@cotds.org> wrote:

> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index b6914539e3..a3d19d5640 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -7,7 +7,8 @@ config BR2_PACKAGE_POCO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
> -		|| BR2_or1k || BR2_riscv || BR2_xtensa)
> +		|| BR2_or1k || (BR2_riscv && !BR2_RISCV_64) \

You could also just change:

	|| BR2_riscv

by:

	|| BR2_RISCV_32

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
