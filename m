From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 14:00:03 +0100
Subject: [Buildroot] [PATCH 2/2]
 package/x11r7/xdriver_xf86-video-nouveau: Fix DRI dependency
In-Reply-To: <1450544015-17658-2-git-send-email-bernd.kuhls@t-online.de>
References: <1450544015-17658-1-git-send-email-bernd.kuhls@t-online.de>
 <1450544015-17658-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151220140003.47c8cb99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 19 Dec 2015 17:53:35 +0100, Bernd Kuhls wrote:

>  config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
>  	bool "xf86-video-nouveau"
>  	depends on BR2_PACKAGE_MESA3D
> +	# package depends on DRI support in xserver_xorg-server
> +	# libdrm locking macros use armv6+ instructions on arm
> +	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
>  	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBDRM_NOUVEAU

I don't quite understand this one. Where are these locking macros
implemented? In the nouveau xf86 driver? In the libdrm nouveau part? In
the mesa3d nouveau part?

The way you worded the comment makes me think it's in libdrm (but I was
unable to find those macros). And if they are in libdrm, then the
dependency should also be used for the libdrm package.

Could you clarify?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
