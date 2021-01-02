From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 17:34:37 +0100
Subject: [Buildroot] [PATCH] package/openblas: allow disabling
 multithreading
In-Reply-To: <20201202145024.13436-1-patrickdepinguin@gmail.com>
References: <20201202145024.13436-1-patrickdepinguin@gmail.com>
Message-ID: <20210102173437.3bc0698f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed,  2 Dec 2020 15:50:24 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> +config BR2_PACKAGE_OPENBLAS_USE_THREAD
> +	bool "use multithreading"
> +	default y
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  Tell OpenBLAS to use multithreading, by passing USE_THREAD=1.
> +
> +config BR2_PACKAGE_OPENBLAS_USE_LOCKING
> +	bool "use locking"
> +	default y
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Should this instead be:

	depends on !BR2_PACKAGE_OPENBLAS_USE_THREAD

indeed, as you're explaining in the help text, when USE_THREAD=1, the
USE_LOCKING option has no effect, as it is forcefully enabled.

And perhaps drop the "default y" ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
