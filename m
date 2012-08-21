From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 21 Aug 2012 17:10:56 +0800
Subject: [Buildroot] [PATCH resend] mplayer: Update to version 1.1.
In-Reply-To: <20120821101240.2a2ce1ce@skate>
References: <1345535615-2553-1-git-send-email-keguang.zhang@gmail.com>
 <20120821101240.2a2ce1ce@skate>
Message-ID: <CAJhJPsUsaMqOMaWZt+eryi2f2U+k+gS-iX+A3jGeavZpQsUu1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/8/21 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Hello,
>
> Le Tue, 21 Aug 2012 15:53:35 +0800,
> Kelvin Cheung <keguang.zhang@gmail.com> a ?crit :
>
> > -MPLAYER_VERSION = 32726
> > -# MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.bz2
> > -# MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
> > -MPLAYER_SITE = svn://svn.mplayerhq.hu/mplayer/trunk
> > +# MPLAYER_VERSION = 32726
> > +MPLAYER_VERSION = 1.1
> > +MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
> > +MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
> > +# MPLAYER_SITE = svn://svn.mplayerhq.hu/mplayer/trunk
>
> Can you remove the comments?
>

OK, will do.


>
> > -# mplayer unfortunately uses --disable-largefiles, so we cannot use
> > -# DISABLE_LARGEFILE
> > -ifeq ($(BR2_LARGEFILE),y)
> > -MPLAYER_CONF_OPTS += --enable-largefiles
> > -else
> > -# dvdread/dvdcss requires largefile support
> > -MPLAYER_CONF_OPTS +=                         \
> > -     --disable-largefiles            \
> > -     --disable-dvdread-internal      \
> > -     --disable-libdvdcss-internal
> > -endif
>
> And so, the dvdread-internal and libdvdcss-internal support no longer
> needs largefile support?
>

Yes, that's right.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
Best Regards!
Kelvin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120821/12c29a6b/attachment.html>
