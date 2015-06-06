From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 11:25:05 +0200
Subject: [Buildroot] [PATCH 09/12] fs/iso9660: add support for isolinux
In-Reply-To: <20150606030327.199f2daf@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605223856.GJ3641@free.fr>
 <20150606030327.199f2daf@free-electrons.com>
Message-ID: <20150606092505.GD3581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-06 03:03 +0200, Thomas Petazzoni spake thusly:
> On Sat, 6 Jun 2015 00:38:56 +0200, Yann E. MORIN wrote:
> > Since I'm quite interested in the end-result of this series
> > (multi-format bootable images), I can help if you don;t have time. Just
> > ping me... ;-)
> 
> Actually, your review is arriving at exactly the right time. I'm having
> a 10+ hours flight tomorrow, which will be a perfect opportunity to
> prepare a v2 of this series.
> 
> I did the v1 on the 10+ hours flight to go, so having something to do
> on the return trip is great.

Happy flight! ;-)

> > > diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
> > > new file mode 100644
> > > index 0000000..2bdf48b
> > > --- /dev/null
> > > +++ b/fs/iso9660/isolinux.cfg
> > > @@ -0,0 +1,6 @@
> > > +default 1
> > > +display sample.msg
> > 
> > Where's that file comming from?
> > 
> > Also, there is the possibility for syslinux/isolinux to display
> > graphics, too, but it is much more invvolved (but that'd be great!)
> 
> The precise reason why there is this leftover "display sample.msg" is
> because I tried to get the splash image support of isolinux to work.
> I didn't succeed and gave up (no Internet access while flying, so I was
> limited to just the isolinux documentation and source code) but forgot
> to kill that line. I'll kill it off for now, until someone interested
> enough in having a splash image with isolinux works on that.

Yeah, I tried a lng time ago, and it was not easy. Hopefully, things
have changed since then, but that can indeed be left as an exercise for
the interested party! :-]

I'm not too fond of splahscreens in the bootloader anyway, so I won't
press for that. I really prefer to have a quick boot that gives me a
running kernel as fast as possible, so I can get access to the
framebuffer from userland, and splash an image early in the boot process
from userland. Bootloader-born splashscreen is for those that can't do
fast boot! Hehehe! :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
