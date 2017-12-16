From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 15:49:50 +0100
Subject: [Buildroot] [PATCH 1/1] janus-gateway: add libcurl check.
In-Reply-To: <20171215133849.5650-1-aduskett@gmail.com>
References: <20171215133849.5650-1-aduskett@gmail.com>
Message-ID: <20171216154950.02ff4574@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Dec 2017 08:38:49 -0500, Adam Duskett wrote:

>  config  BR2_PACKAGE_JANUS_STREAMING
>  	bool "streaming"
> -	# SO_REUSEPORT

Why is this removed ?

>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> +	help
> +	  Enable streaming plugin.
> +	  Note: For RTSP streaming support, libcurl must be selected.
>  
>  comment "streaming plugin needs a toolchain w/ headers >= 3.9"
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> @@ -90,7 +92,7 @@ config BR2_PACKAGE_JANUS_WEBSOCKETS
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_LIBWEBSOCKETS
>  
> -endif
> +endif #BR2_PACKAGE_JANUS_GATEWAY

This change is unrelated.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
