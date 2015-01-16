From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 16 Jan 2015 17:04:20 +0100
Subject: [Buildroot] [PATCH v5 07/15] xdriver_xf86-video-imx-viv: new
	package
In-Reply-To: <20141227214325.2135108d@free-electrons.com>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-8-git-send-email-jezz@sysmic.org>
 <20141227214325.2135108d@free-electrons.com>
Message-ID: <1673331.jGUK3KeLGv@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Saturday 27 December 2014 21:43:25 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue,  9 Dec 2014 14:46:45 +0100, J?r?me Pouiller wrote:
> 
> > diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in 
b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> > new file mode 100644
> > index 0000000..d91ba79
> > --- /dev/null
> > +++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> > @@ -0,0 +1,31 @@
> > +
> 
> Unneeded empty line.
> 
> > +config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
> > +	bool "xf86-video-imx-viv"
> > +	depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
> > +	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with 
glx/dri
> > +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
> 
> The world of OpenGL stuff will always surprise me. Why on earth does a
> X.org driver that uses a proprietary OpenGL implementation needs
> Mesa3D ?!?

In fact, xf86-video-imx-viv does not depends directly on mesa3d. However, it 
depend on xorg server compiled with --enable-dri --enable-glx. But, these 
options are enabled only if BR2_PACKAGE_MESA3D_DRI_DRIVER is enabled.



Else, I am going to send an updated version of this patch this evening.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
