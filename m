From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 04 Mar 2009 14:27:05 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/alsa-utils
In-Reply-To: <20090304132251.3B72D7626E@busybox.osuosl.org>
References: <20090304132251.3B72D7626E@busybox.osuosl.org>
Message-ID: <49AE81A9.2090605@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org wrote:

<snipp>

> --- trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 13:22:44 UTC (rev 25523)
> +++ trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 13:22:50 UTC (rev 25524)
> @@ -35,9 +35,12 @@
>  
>  config BR2_PACKAGE_ALSA_UTILS_APLAY
>  	bool "aplay"
> -	select BR2_LARGEFILE
> +	depends on BR2_LARGEFILE
>  	depends on BR2_PACKAGE_ALSA_UTILS
>  
> +comment "aplay requires a toolchain with LARGEFILE support"
> +	depends on !BR2_LARGEFILE
> +
>  config BR2_PACKAGE_ALSA_UTILS_ARECORD
>  	bool "arecord"
>  	depends on BR2_PACKAGE_ALSA_UTILS
> 

I guess this also depends on LARGEFILE, arecord is just a symlink to aplay.

-- 
Best regards,
Hans-Christian Egtvedt
