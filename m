From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 22:37:34 +0200
Subject: [Buildroot] PATCH [2/2] update x11r7 packages to
	use	NAME_PREFIX when calling AUTOTARGETS
In-Reply-To: <46FD7109.6000500@promwad.com>
References: <46FD7109.6000500@promwad.com>
Message-ID: <20070928203734.GX20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 12:24:25AM +0300, Ivan Kuten wrote:
>Hello,
>
>The second patch updates x11r7 packages to use NAME_PREFIX when calling AUTOTARGETS:
>
>----------------------------------
>
>Index: package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk
>===================================================================
>--- package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk	(revision 20086)
>+++ package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk	(working copy)
>@@ -10,4 +10,4 @@
> XDRIVER_XF86_VIDEO_VIA_AUTORECONF = YES
> XDRIVER_XF86_VIDEO_VIA_DEPENDENCIES = xserver_xorg-server libdrm xlib_libX11 xlib_libXvMC xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto
>xproto_xproto
>
>-$(eval $(call AUTOTARGETS,xdriver_xf86-video-via))
>+$(eval $(call AUTOTARGETS,xdriver_xf86-video-via,x11r7))

Oh, and it would be more intuitive -- at least for me -- if you would
prepend the DIR_PREFIX, as in 

>-$(eval $(call AUTOTARGETS,xdriver_xf86-video-via))
>+$(eval $(call AUTOTARGETS,x11r7,xdriver_xf86-video-via))

, please.
