From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:03:58 +0200
Subject: [Buildroot] [PATCH v2] x11vnc: make x11vnc select libvncserver
In-Reply-To: <20170430130502.32345-1-martink@posteo.de>
References: <20170430084350.zpxjcn7y6ws4w4lf@sapphire.tkos.co.il>
 <20170430130502.32345-1-martink@posteo.de>
Message-ID: <20170430230358.1cd5d582@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 15:05:02 +0200, Martin Kepplinger wrote:

> diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
> index 0909b9aec..9d9541cbf 100644
> --- a/package/x11vnc/Config.in
> +++ b/package/x11vnc/Config.in
> @@ -2,9 +2,11 @@ config BR2_PACKAGE_X11VNC
>  	bool "x11vnc"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_nios2 # from libvncserver

The comment is normally just "# libvncserver"

>  	select BR2_PACKAGE_XLIB_LIBXT
>  	select BR2_PACKAGE_XLIB_LIBXEXT
>  	select BR2_PACKAGE_XLIB_LIBXTST
> +	select BR2_PACKAGE_LIBVNCSERVER

We try to keep things sorted alphabetically, so this select should have
been before the other ones.

> diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
> index 9233b7047..5a505b920 100644
> --- a/package/x11vnc/x11vnc.mk
> +++ b/package/x11vnc/x11vnc.mk
> @@ -16,6 +16,8 @@ X11VNC_LICENSE_FILES = COPYING
>  # Source coming from github, no configure included
>  X11VNC_AUTORECONF = YES
>  
> +X11VNC_DEPENDENCIES += libvncserver

No need for a new X11VNC_DEPENDENCIES assignment here, there was
already one a few lines above.

I've fixed those minor issues and applied your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
