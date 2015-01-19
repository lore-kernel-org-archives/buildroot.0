From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jan 2015 23:20:43 +0100
Subject: [Buildroot] [PATCH v5 07/15] xdriver_xf86-video-imx-viv: new
 package
In-Reply-To: <1664407.TbGWHQXnSi@sagittea>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1673331.jGUK3KeLGv@aquila>
 <20150116171533.64116d5f@free-electrons.com>
 <1664407.TbGWHQXnSi@sagittea>
Message-ID: <20150119222043.GF4217@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-01-17 01:11 +0100, J?r?me Pouiller spake thusly:
> On Friday 16 January 2015 17:15:33 Thomas Petazzoni wrote:
> > Dear J?r?me Pouiller,
> > 
> > On Fri, 16 Jan 2015 17:04:20 +0100, J?r?me Pouiller wrote:
> > 
> > > > The world of OpenGL stuff will always surprise me. Why on earth does a
> > > > X.org driver that uses a proprietary OpenGL implementation needs
> > > > Mesa3D ?!?
> > > 
> > > In fact, xf86-video-imx-viv does not depends directly on mesa3d. However, it 
> > > depend on xorg server compiled with --enable-dri --enable-glx. But, these 
> > > options are enabled only if BR2_PACKAGE_MESA3D_DRI_DRIVER is enabled.
> > 
> > Maybe this should be changed, so that other drivers can enable it,
> > without referencing Mesa related options, no?
> > 
> > Also, the code in the xserver package does:
> > 
> > ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> > XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
> > XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
> > else
> > XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
> > endif
> > 
> > So it really builds mesa as well. Is this needed ?
> We cannot use gpu-viv-bin-mx6q to compile Xorg with DRI and GLX since 
> it does not provide all necessary files. Especially, OpenGL headers 
> (GL/gl.h, GL/glx.h, ...) are missing[1]. We may solve this issue using
> "opengl-registry" posted by Yann a few months ago. It may be 
> sufficient.

For the records, I've posted an updated series:
    http://lists.busybox.net/pipermail/buildroot/2015-January/117642.html

Care to see if it is posible to update your series to use the Khronos
registry/ies? If so, it would great if you could review/ack the patches
so they get applied soon, so you can in turn repost an updated series of
yours! ;-)

/me is trying to get some reviewers interested! Muhahaha! ;-)

Regards,
Yann E. MORIN.

> Note that the current implementation is same than the one used in Yocto
> and it is officially supported by Freescale. (I do not say it is the
> right way, but it is a sufficient justification for many users)
> 
> 
> [1] https://community.freescale.com/thread/312546
> 
> -- 
> J?r?me Pouiller, Sysmic
> Embedded Linux specialist
> http://www.sysmic.fr
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
