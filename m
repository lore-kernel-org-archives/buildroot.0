From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 18:51:16 +0200
Subject: [Buildroot] [PATCH 1/2] Config.in: update description of
 BR2_PREFER_STATIC_LIB
In-Reply-To: <1413131685-5567-2-git-send-email-abrodkin@synopsys.com>
References: <1413131685-5567-1-git-send-email-abrodkin@synopsys.com>
 <1413131685-5567-2-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141012185116.2f24af40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Sun, 12 Oct 2014 18:34:44 +0200, Alexey Brodkin wrote:

> diff --git a/Config.in b/Config.in
> index 24aa883..66cea4a 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -536,15 +536,18 @@ comment "enabling Stack Smashing Protection requires support in the toolchain"
>  	depends on !BR2_TOOLCHAIN_HAS_SSP
>  
>  config BR2_PREFER_STATIC_LIB
> -	bool "prefer static libraries"
> +	bool "build statically linked applications, no dynamic libraries"
>  	help
> -	  Where possible, build and use static libraries for the target.
> -	  This potentially increases your code size and should only be
> +	  Build all application for the target statically linked.
> +	  This potentially increases your filesystem size and should only be
>  	  used if you know what you do.
> -	  The default is to build dynamic libraries and use those on
> -	  the target filesystem.
>  
> -	  WARNING: This is highly experimental at the moment.
> +	  Note that some applications cannot be build statically and so are
> +	  intentionally disabled.
> +
> +	  The default is to build dynamic libraries and dynamically linked
> +	  applications to use those on the target filesystem.

"The default" should be clarified as "When this option is disabled".

Also linked -> link.

With this fixed (probably Peter can fix this when applying):

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
