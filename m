From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 22:35:11 +0100
Subject: [Buildroot] [PATCH 1/2] vnstat: bump to version 1.14
In-Reply-To: <1448990698-31684-1-git-send-email-rprebello@gmail.com>
References: <1448990698-31684-1-git-send-email-rprebello@gmail.com>
Message-ID: <20151201223511.5eb286a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rodrigo,

On Tue,  1 Dec 2015 15:24:57 -0200, Rodrigo Rebello wrote:

> diff --git a/package/vnstat/Config.in b/package/vnstat/Config.in
> index 0df4982..ed86701 100644
> --- a/package/vnstat/Config.in
> +++ b/package/vnstat/Config.in
> @@ -1,11 +1,16 @@
>  config BR2_PACKAGE_VNSTAT
>  	bool "vnstat"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR # mbstowcs()
>  	help
> -	  vnStat is a console-based network traffic monitor that keeps a log of
> -	  network traffic for the selected interface(s). It uses the network
> -	  interface statistics provided by the kernel as information source.
> -	  This means that vnStat won't actually be sniffing any traffic and also
> -	  ensures light use of system resources.
> +	  vnStat is a console-based network traffic monitor that keeps a
> +	  log of network traffic for the selected interface(s). It uses
> +	  the network interface statistics provided by the kernel as
> +	  information source. This means that vnStat won't actually be
> +	  sniffing any traffic and also ensures light use of system
> +	  resources.
>  
>  	  http://humdi.net/vnstat
> +
> +comment "vnstat needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR

You need:

	depends on BR2_USE_MMU

here so that the comment is not displayed if we're using a no-MMU
architecture.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
