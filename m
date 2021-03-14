From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:07:12 +0100
Subject: [Buildroot] [PATCH v2 4/6] package/openal: disable package if
 binutils is affected from bug 27100
In-Reply-To: <20210310091453.23611-5-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
 <20210310091453.23611-5-giulio.benetti@benettiengineering.com>
Message-ID: <20210314230712.13207ad0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Mar 2021 10:14:51 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package is affected from binutils bug 21464, since there is no

You're using the BUG_27100 condition, not 21464.

> diff --git a/package/openal/Config.in b/package/openal/Config.in
> index 6b0e9973db..def95222de 100644
> --- a/package/openal/Config.in
> +++ b/package/openal/Config.in
> @@ -19,6 +19,7 @@ config BR2_PACKAGE_OPENAL
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100

What about all the things that select BR2_PACKAGE_OPENAL ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
