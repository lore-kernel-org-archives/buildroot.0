From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 19:52:07 +0100
Subject: [Buildroot] [PATCH 5/5] package/libsepol: set default policy
 version
In-Reply-To: <20200203132951.1331252-5-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
 <20200203132951.1331252-5-aduskett@gmail.com>
Message-ID: <20200203195207.7edbc44b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 05:29:51 -0800
Adam Duskett <aduskett@gmail.com> wrote:

>  config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
>  	int "Policy version"
> -	default 30
> +	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
> +	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> +	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
> +	default 28 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> +	default 26 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
> +	default 25
> +	help
> +	  The maximum SELinux policy version your kernel supports.
> +
> +	  Here's a handy table to help you choose:
> +	  kernel version   SElinux policy max version
> +	  <= 2.6.x         25
> +	  > 2.6 <= 3.5     26
> +	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
> +	  > 3.14 <= 4.3    29
> +	  > 4.3 <= 4.13    30
> +	  > 4.13 <= 5.5    31

The <= 5.5 didn't make much sense here. As of now, 31 is the policy
version of anything > 4.13, which includes kernels also above 5.5. We
can update that when version 32 starts to be used.

I've fixed that when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
