From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 16:52:39 +0100
Subject: [Buildroot] [PATCH 06/16] xapp_mkfontscale: enable compilation
	for the host
In-Reply-To: <e87463aceffce66c0aa82dbdf66fe66cf0cc770c.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:42:57 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<e87463aceffce66c0aa82dbdf66fe66cf0cc770c.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bpfhjmig.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> mkfontscale on the host is required to build xfonts-encoding for the
 Thomas> target.

 Thomas> diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
 Thomas> index 05a3f81..e94312a 100644
 Thomas> --- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
 Thomas> +++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
 Thomas> @@ -8,6 +8,8 @@ XAPP_MKFONTSCALE_VERSION = 1.0.5
 Thomas>  XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 Thomas>  XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 Thomas>  XAPP_MKFONTSCALE_AUTORECONF = NO
 Thomas> -XAPP_MKFONTSCALE_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
 Thomas> +XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libX11 xlib_libfontenc
 Thomas> +HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc

No host-xlib_libX11?

-- 
Bye, Peter Korsgaard
