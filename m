From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 18:18:21 +0100
Subject: [Buildroot] [PATCH v2 1/2] libsigrok: enable building C++
 bindings
In-Reply-To: <1424691169-14397-2-git-send-email-bgolaszewski@baylibre.com>
References: <1424691169-14397-1-git-send-email-bgolaszewski@baylibre.com>
 <1424691169-14397-2-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150223181821.67d09c62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Mon, 23 Feb 2015 12:32:48 +0100, Bartosz Golaszewski wrote:

> +config BR2_PACKAGE_LIBSIGROKCXX
> +	bool "build C++ bindings"
> +	select BR2_PACKAGE_GLIBMM
> +	depends on BR2_PACKAGE_LIBSIGROK
> +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX

This should have been BR2_INSTALL_LIBSTDCPP, otherwise your code only
works for internal toolchains, not external toolchains.

> +	help
> +	  Build libsigrok C++ bindings as well.
> +
>  comment "libsigrok needs a toolchain w/ wchar, threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "libsigrokcxx needs a toolchain w/ C++"
> +	depends on BR2_PACKAGE_LIBSIGROK

Instead of repeating this dependency here and in the definition of the
BR2_PACKAGE_LIBSIGROKCXX, I've simply placed both under a 'if
BR2_PACKAGE_LIBSIGROKCXX ... endif' condition.

Applied to next with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
