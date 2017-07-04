From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 18:34:29 +0200
Subject: [Buildroot] [PATCH] package/systemd: needs timezone info
In-Reply-To: <20170704112120.26559-1-yann.morin.1998@free.fr>
References: <20170704112120.26559-1-yann.morin.1998@free.fr>
Message-ID: <20170704183429.1fdc3679@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 13:21:20 +0200, Yann E. MORIN wrote:

> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 478cc104a9..a1b68b2809 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -13,6 +13,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	depends on !BR2_STATIC_LIBS # kmod
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
>  	depends on BR2_USE_MMU # dbus
> +	select BR2_TARGET_TZ_INFO
>  	select BR2_PACKAGE_HAS_UDEV
>  	select BR2_PACKAGE_DBUS # runtime dependency only
>  	select BR2_PACKAGE_LIBCAP

Thanks, applied to master after fixing alphabetic ordering.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
