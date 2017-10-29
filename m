From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 17:34:56 +0100
Subject: [Buildroot] [PATCH] package/libbsd: not available for arc
In-Reply-To: <20171029155547.25602-1-yann.morin.1998@free.fr>
References: <20171029155547.25602-1-yann.morin.1998@free.fr>
Message-ID: <20171029173456.5007a31e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 16:55:47 +0100, Yann E. MORIN wrote:

> diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
> index 9b5b89812f..091b668075 100644
> --- a/package/libbsd/Config.in
> +++ b/package/libbsd/Config.in
> @@ -1,7 +1,9 @@
>  config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
>  	bool
> -	# libbsd does not support the MicroBlaze ELF machine type (see local-elf.h)
> -	default y if !BR2_microblaze
> +	# libbsd does not support those architectures (see src/local-elf.h)
> +	default y
> +	depends on !BR2_microblaze
> +	depends on !BR2_arcle && !BR2_arcle

Really? I guess you wanted to also exclude ARC big-endian, no?

Also, I believe it would be useful to explain in the commit log why
this problem was not visible before: because libbsd depends on glibc,
and we only recently enabled glibc support for ARC.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
