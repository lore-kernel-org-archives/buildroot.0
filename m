From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:30:35 +0100
Subject: [Buildroot] [PATCH 6/7] libsigrok: enable building C++ bindings
In-Reply-To: <1424435342-2188-7-git-send-email-bgolaszewski@baylibre.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
 <1424435342-2188-7-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150220193035.7f90d46f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Fri, 20 Feb 2015 13:29:01 +0100, Bartosz Golaszewski wrote:

> +config BR2_PACKAGE_LIBSIGROKCXX
> +	bool "build C++ bindings"
> +	select BR2_PACKAGE_GLIBMM
> +	depends on BR2_PACKAGE_LIBSIGROK
> +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> +	# C++11 support
> +	depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC || BR2_TOOLCHAIN_BUILDROOT_EGLIBC

I am not really happy with this, because there are potentially plenty
of external toolchains that support C++11. So I believe we really need
to go ahead and add a:

	BR2_TOOLCHAIN_HAS_CXX11

And make sure it gets properly selected depending on whether the
toolchain has C++11 support or not. You can look at how
BR2_TOOLCHAIN_HAS_SSP or BR2_TOOLCHAIN_HAS_THREADS are implemented for
example.

Moreover, you make this apparently depend on the selected C library.
But isn't C++11 support purely a gcc problem ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
