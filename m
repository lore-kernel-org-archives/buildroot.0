From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 17:15:33 +0100
Subject: [Buildroot] [PATCH v5 07/15] xdriver_xf86-video-imx-viv: new
 package
In-Reply-To: <1673331.jGUK3KeLGv@aquila>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-8-git-send-email-jezz@sysmic.org>
 <20141227214325.2135108d@free-electrons.com>
 <1673331.jGUK3KeLGv@aquila>
Message-ID: <20150116171533.64116d5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 16 Jan 2015 17:04:20 +0100, J?r?me Pouiller wrote:

> > The world of OpenGL stuff will always surprise me. Why on earth does a
> > X.org driver that uses a proprietary OpenGL implementation needs
> > Mesa3D ?!?
> 
> In fact, xf86-video-imx-viv does not depends directly on mesa3d. However, it 
> depend on xorg server compiled with --enable-dri --enable-glx. But, these 
> options are enabled only if BR2_PACKAGE_MESA3D_DRI_DRIVER is enabled.

Maybe this should be changed, so that other drivers can enable it,
without referencing Mesa related options, no?

Also, the code in the xserver package does:

ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
else
XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
endif

So it really builds mesa as well. Is this needed ?

Can you clarify this, maybe talking with Bernd?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
