From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:56:58 +0200
Subject: [Buildroot] [PATCH 2/3] package/mesa3d: disable broken
 toolchains on nios2
In-Reply-To: <1438198976-25523-2-git-send-email-bernd.kuhls@t-online.de>
References: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
 <1438198976-25523-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150729225658.118936f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Jul 2015 21:42:55 +0200, Bernd Kuhls wrote:

> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index c702d0d..2926c89 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -11,6 +11,9 @@ menuconfig BR2_PACKAGE_MESA3D
>  	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	# Triggers the _gp link issue in nios2
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405

You forgot to propagate these new dependencies to the comment about
toolchain dependencies. I've done that and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
