From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 03 Oct 2014 17:02:30 +0200
Subject: [Buildroot] [PATCH 01/11] mesa3d: Fix package requirements
In-Reply-To: <XnsA3BBAA6C3899DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
 <1923213.bFy6dBPsRI@sagittea>
 <XnsA3BBAA6C3899DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <3747935.D13VhBWT0H@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 03 October 2014 16:45:12 Bernd Kuhls wrote:
> J?r?me Pouiller <jezz@sysmic.org> wrote in
> 
> news:1923213.bFy6dBPsRI at sagittea:
> > Arf, this was fixed by d0edceb ("mesa3d: fix build without dri
> > drivers"), but this breaks xdriver_xf86-video-imx DRI support.
> 
> Hi,
> 
> what about adding
> 
> depends on BR2_PACKAGE_XPROTO_DRI3PROTO
> 
> to package/x11r7/xdriver_xf86-video-imx-viv/Config.in?
I need mesa3d with --enable-dri, even if no DRI drivers are selected. I am 
going to enable DRI if BR2_PACKAGE_MESA3D_DRI_DRIVER is set (currently, it 
ensable if MESA3D_DRI_DRIVERS-y is set). Therefore, I could enable 
BR2_PACKAGE_MESA3D_DRI_DRIVER in xdriver_xf86-video-imx package.

I will resens my serie soon.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
