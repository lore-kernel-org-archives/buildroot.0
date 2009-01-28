From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 28 Jan 2009 08:10:26 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
In-Reply-To: <20090127151010.080DA7709E@busybox.osuosl.org>
References: <20090127151010.080DA7709E@busybox.osuosl.org>
Message-ID: <20090128081026.55f4a8f8@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Jan 2009 15:10:09 +0000 (UTC)
jacmet at uclibc.org wrote:

<snipp>

> --- trunk/buildroot/package/webkit/Config.in	2009-01-27
> 15:02:40 UTC (rev 25080) +++
> trunk/buildroot/package/webkit/Config.in	2009-01-27 15:10:08
> UTC (rev 25081) @@ -1,5 +1,7 @@ config BR2_PACKAGE_WEBKIT
>  	bool "webkit"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR

Do you need C++/WCHAR for webkit as well, or only icu? If it is only
icu then should not kconfig take care of this dependency since
selecting icu package will not be possible?

>  	select BR2_PACKAGE_LIBGTK2
>  	select BR2_PACKAGE_ICU
>  	select BR2_PACKAGE_CURL
> @@ -11,3 +13,5 @@
>  
>  		http://webkit.org/
>  
> +comment "webkit requires a toolchain with C++ support and WCHAR
> enabled"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> 

And then make a depends on package icu instead?

-- 
Best regards,
Hans-Christian Egtvedt
