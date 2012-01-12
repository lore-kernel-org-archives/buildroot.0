From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Jan 2012 00:29:49 +0100
Subject: [Buildroot] [PATCH] Adding xf86-input-tslib driver
In-Reply-To: <1324745464-10155-1-git-send-email-sergiosiena@gmail.com>
References: <1324745464-10155-1-git-send-email-sergiosiena@gmail.com>
Message-ID: <201201130029.49859.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 24 December 2011 17:51:04 Sergio Prado wrote:
> Adding xf86-input-tslib driver so X11 can talk directly to 
> touchscreen devices.
> 
> Signed-off-by: Sergio Prado <sergiosiena@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Also compile-tested for ARM with codesourcery.

> diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
> new file mode 100644
> index 0000000..4c3f719
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
> +       bool "xf86-input-tslib"
> +       select BR2_PACKAGE_XPROTO_INPUTPROTO
> +       select BR2_PACKAGE_XSERVER_XORG_SERVER
> +       select BR2_PACKAGE_XPROTO_RANDRPROTO
> +       select BR2_PACKAGE_XPROTO_XPROTO
 Missing
	  select BR2_PACKAGE_TSLIB

> +       help
> +         Touch screen library input driver
> diff --git
> a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
> new file mode 100644
> index 0000000..eb550c2
> --- /dev/null
> +++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# xdriver_xf86-input-tslib -- Touch screen library input driver
> +#
> +################################################################################
> +XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
> +XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
> +XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.ptxdist.org/software/xf86-input-tslib/download
> +XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto 

 Missing dependency on tslib.

 The randr and input dependencies are actually optional.  But I guess
it doesn't hurt that much to force them on.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
