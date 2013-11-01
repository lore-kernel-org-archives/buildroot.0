From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:37:51 +0100
Subject: [Buildroot] [PATCH 1/1] openpgm: disable on AVR32
In-Reply-To: <1383209956-31840-1-git-send-email-alexander.lukichev@gmail.com>
References: <1383209956-31840-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <20131101153751.0ff4e7f5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Thu, 31 Oct 2013 10:59:16 +0200, Alexander Lukichev wrote:

>  config BR2_PACKAGE_OPENPGM
>  	bool "openpgm"
> +	depends on !BR2_avr32

Would be good to add a comment explaining why we have this (compiler
too old, missing intrinsics)

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INET_IPV6
>  	depends on BR2_USE_WCHAR
> @@ -14,3 +15,7 @@ config BR2_PACKAGE_OPENPGM
>  
>  comment "openpgm needs a toolchain w/ wchar, threads, IPv6"
>  	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6 && BR2_USE_WCHAR)
> +	depends on !BR2_avr32
> +
> +comment "openpgm is BROKEN on AVR32"
> +	depends on BR2_avr32

We generally don't add comments for such cases (i.e package not
available on the selected architecture).

> diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
> index 42e13d2..3e8516c 100644
> --- a/package/zeromq/Config.in
> +++ b/package/zeromq/Config.in
> @@ -30,6 +30,7 @@ config BR2_PACKAGE_ZEROMQ
>  config BR2_PACKAGE_ZEROMQ_PGM
>  	bool "PGM/EPGM support"
>  	depends on BR2_PACKAGE_ZEROMQ
> +	depends on !BR2_avr32

Maybe:

	depends on !BR2_avr32 # openpgm

>  	select BR2_PACKAGE_OPENPGM
>  	help
>  	  Add support for Pragmatic General Multicast protocol (RFC 3208)

Can you fix these minor comments and resend an updated version?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
