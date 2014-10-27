From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:15:02 +0100
Subject: [Buildroot] [PATCH 07/15 v6] package/mesa3d: depends on libudev,
 not udev
In-Reply-To: <337a1970f6cec5755ed0b7ed73f3e6b31b84c2ca.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
 <337a1970f6cec5755ed0b7ed73f3e6b31b84c2ca.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <20141027221502.787a23d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 27 Oct 2014 13:46:15 -0700, Yann E. MORIN wrote:

> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 74ebbed..b55173d 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_MESA3D
>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
> -	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_PACKAGE_HAS_LIBUDEV

I thought the main conclusion from the meeting was that 'select' should
be used instead of 'depends on' for libudev, no?

From the report at http://elinux.org/Buildroot:DeveloperDaysELCE2014:
"We would also like to change the depends on libudev into select
libudev.".

Am I missing something here?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
