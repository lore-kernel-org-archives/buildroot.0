From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Feb 2019 09:30:57 +0100
Subject: [Buildroot] [git commit] package/poco: disable build for riscv
In-Reply-To: <20190220204935.E68CC8847E@busybox.osuosl.org>
References: <20190220204935.E68CC8847E@busybox.osuosl.org>
Message-ID: <20190221093057.648e0836@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Feb 2019 21:51:09 +0100
Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> wrote:

> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index 75e31b7e1e..7e1257146c 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_POCO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
> -		|| BR2_or1k || BR2_xtensa)
> +		|| BR2_or1k || BR2_riscv || BR2_xtensa)

Perhaps at some point we should invert this logic and move to an option
like this:

config BR2_PACKAGE_POCO_ARCH_SUPPORTS
	bool
	default y if ...
	default y if ...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
