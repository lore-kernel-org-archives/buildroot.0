From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Aug 2015 22:11:05 +0200
Subject: [Buildroot] [PATCH 1/3 v2] package/xserver: commonalise
 dependency on libdrm
In-Reply-To: <20150731165905.GA3751@free.fr>
References: <cover.1438297123.git.yann.morin.1998@free.fr>
 <de75aa7f5d075edcaa2c25e4d021bd5b105e2bb1.1438297123.git.yann.morin.1998@free.fr>
 <20150731075737.01ad8236@free-electrons.com>
 <20150731165905.GA3751@free.fr>
Message-ID: <20150805201104.GE3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-31 18:59 +0200, Yann E. MORIN spake thusly:
> On 2015-07-31 07:57 +0200, Thomas Petazzoni spake thusly:
> > On Fri, 31 Jul 2015 00:59:05 +0200, Yann E. MORIN wrote:
> > >  ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> > > -XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-libdrm --enable-glx
> > > -XSERVER_XORG_SERVER_DEPENDENCIES += libdrm mesa3d xproto_xf86driproto
> > > +XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
> > > +XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
> > > +XSERVER_XORG_SERVER_NEEDS_LIBDRM = y
> > 
> > Hum, didn't we say that this should be a hidden Config.in boolean?
> 
> Yes, you suggested so; I said yes; I tried; I said no... ;-)
>     http://lists.busybox.net/pipermail/buildroot/2015-July/135100.html
> 
> Basically, all the conditional code is in the .mk , and there's almost
> no conditional in the Config.in.
> 
> So, I'd like not to duplicate the decision making in Config.in and keep
> all in a single place, the .mk .
> 
> That's why I did not move that to a blind kconfig option.

Did you make up your mind about this?

Now that we've switched to a mdular server by default, this series is
now fixing actual autobuild errors...

If you really prefer that we duplicate all the logic in Config.in , I'll
do it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
