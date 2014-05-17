From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 16:11:34 +0200
Subject: [Buildroot] [PATCH v7 31/31] xbmc needs IPv6 support
In-Reply-To: <1400326806-16428-32-git-send-email-bernd.kuhls@t-online.de>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
 <1400326806-16428-32-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517161134.24d42424@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 May 2014 13:40:06 +0200, Bernd Kuhls wrote:

>  config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
>  	bool "shairport"
> -	depends on BR2_INET_IPV6
>  	select BR2_PACKAGE_LIBSHAIRPLAY
>  	help
>  	  Enable Shairport support.
>  	  Select this if you want to stream content from an Apple device.
>  
> -comment "shairport support needs a toolchain w/ IPv6"
> -	depends on !BR2_INET_IPV6

This partially reverts PATCH 20/31 from your series. It doesn't make
much sense to have one patch in the series doing one thing, and then a
later patch reverting that thing, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
