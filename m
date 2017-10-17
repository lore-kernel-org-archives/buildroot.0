From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 21:57:23 +0200
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: new package
In-Reply-To: <20171017192257.9215-1-Adamduskett@outlook.com>
References: <20171017192257.9215-1-Adamduskett@outlook.com>
Message-ID: <20171017215723.4d3417d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 15:22:57 -0400, Adam Duskett wrote:
> diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
> new file mode 100644
> index 0000000000..d6acabea8a
> --- /dev/null
> +++ b/package/libcpprestsdk/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LIBCPPRESTSDK
> +	bool "libcpprestsdk"
> +	depends on BR2_INSTALL_LIBSTDCPP # boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_BOOST

Boost depends on BR2_USE_WCHAR, you forgot to propagate this
dependency.

> +	select BR2_PACKAGE_BOOST_RANDOM
> +	select BR2_PACKAGE_BOOST_CHRONO
> +	select BR2_PACKAGE_BOOST_THREAD
> +	select BR2_PACKAGE_BOOST_REGEX
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
> +	help
> +	  The C++ REST SDK is a Microsoft project for cloud-based
> +	  client-server communication in native code using a modern
> +	  asynchronous C++ API design. This project aims to help C++
> +	  developers connect to and interact with services.
> +
> +	  https://github.com/Microsoft/cpprestsdk
> +
> +comment "cpprestsdk needs a toolchain w/ C++, threads"
> +	depends on BR2_USE_MMU

Why do you have this BR2_USE_MMU dependency here, when it's not on the
main BR2_PACKAGE_LIBCPPRESTSDK option ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
