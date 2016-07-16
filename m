From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 14:02:10 +0200
Subject: [Buildroot] [PATCH] xapp_init: Point to target's "mcookie"
In-Reply-To: <1468530639-38934-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1468530639-38934-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160716140210.1258ae0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The title was slightly incorrect: the package is named xapp_xinit, not
xapp_init.

On Thu, 14 Jul 2016 16:10:39 -0500, Matt Weber wrote:

> From: ynadupur <yugendra.sai.babu.nadupuru@rockwellcollins.com>

This From: line didn't match the SoB line.

> Description:

Not needed.

>     The X11 package builds the "mcookie" executable, when selected, into the
>     directory output/host/usr/bin/mcookie. The xapp_init's "configure"
>     attempts to find the "mcookie" executable using the host's path. If the
>     host has an installed "mcookie" application in their /bin folder, it
>     can influence the build. The following patch forces the expected
>     mcookie location.

Indentation not needed.

> diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
> index a67ba14..bf5cbbb 100644
> --- a/package/x11r7/xapp_xinit/xapp_xinit.mk
> +++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
> @@ -11,4 +11,8 @@ XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
>  XAPP_XINIT_LICENSE = MIT
>  XAPP_XINIT_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_MCOOKIE),y)

I've removed this conditional, because xapp_xinit depends on the X.org
server, and the X.org server selects BR2_PACKAGE_MCOOKIE.

Applied with these issues fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
