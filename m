From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 23:23:44 +0200
Subject: [Buildroot] [PATCH] libcap-ng: doesn't build on AVR32,
	requires TLS support
In-Reply-To: <871u3yfddd.fsf@dell.be.48ers.dk>
References: <1381077279-19561-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <871u3yfddd.fsf@dell.be.48ers.dk>
Message-ID: <20131006232344.493a4ebc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 06 Oct 2013 20:44:30 +0200, Peter Korsgaard wrote:

>  Thomas> diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
>  Thomas> index d1663cd..b799dc9 100644
>  Thomas> --- a/package/libcap-ng/Config.in
>  Thomas> +++ b/package/libcap-ng/Config.in
>  Thomas> @@ -1,5 +1,7 @@
>  Thomas>  config BR2_PACKAGE_LIBCAP_NG
>  Thomas>  	bool "libcap-ng"
>  Thomas> +	# tls support, needed by libcap-ng, not available on avr32
>  Thomas> +	depends on !BR2_avr32
> 
> Shouldn't it then depend on BR2_GCC_ENABLE_TLS (and the avr32 toolchain
> not select it)?

It wouldn't work with external toolchains, which is the reason why I
excluded the AVR32 architecture rather than using a BR2_GCC_ENABLE_TLS
condition.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
