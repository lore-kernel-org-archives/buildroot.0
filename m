From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 May 2015 10:32:11 +0200
Subject: [Buildroot] [PATCH] package/libsigrok: blacklist CS powerpc
 toolchains
In-Reply-To: <1431888482-27125-1-git-send-email-romain.naour@openwide.fr>
References: <1431888482-27125-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150519103211.10b2ccc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 17 May 2015 20:48:02 +0200, Romain Naour wrote:

> diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
> index 93bd06f..cd44118 100644
> --- a/package/libsigrok/Config.in
> +++ b/package/libsigrok/Config.in
> @@ -22,6 +22,8 @@ config BR2_PACKAGE_LIBSIGROKCXX
>  	bool "build C++ bindings"
>  	select BR2_PACKAGE_GLIBMM
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	# CS powerpc g++ are too old. libsigrokcxx needs C++11
> +	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
>  	help
>  	  Build libsigrok C++ bindings as well.
>  
> diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
> index df27cde..00cf37b 100644
> --- a/package/pulseview/Config.in
> +++ b/package/pulseview/Config.in
> @@ -16,6 +16,8 @@ config BR2_PACKAGE_PULSEVIEW
>  	depends on BR2_USE_MMU
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +	# CS powerpc g++ are too old. libsigrokcxx needs C++11
> +	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
>  	help
>  	  PulseView is a Qt based logic analyzer, oscilloscope
>  	  and MSO GUI for sigrok.

You forgot to propagate this new dependency to the Config.in comment
related to the BR2_PACKAGE_LIBSIGROKCXX and BR2_PACKAGE_PULSEVIEW
options.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
