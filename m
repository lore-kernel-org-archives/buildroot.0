From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 May 2012 16:55:19 +0300
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <20120507154541.325b298d@skate>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
 <20120507110012.GB8916@sapphire.tkos.co.il>
 <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
 <20120507154541.325b298d@skate>
Message-ID: <20120507135519.GE8916@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 07, 2012 at 03:45:41PM +0200, Thomas Petazzoni wrote:
> Le Mon, 7 May 2012 08:47:10 -0400,
> Dimitry Golubovsky <golubovsky@gmail.com> a ?crit :
> 
> > >> +define V86D_BUILD_CMDS
> > >> + ? ? $(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C
> > >> $(@D) all
> > >
> > > You can used $(TARGET_CONFIGURE_OPTS) here as well.
> > 
> > I tried that, and it did not compile. -D__i386__ should be given
> > explicitly to cc.
> 
> This -D is rather a CFLAGS, so:
> 
> 	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D__i386__" -C $(@D) all

But then you'll have CFLAGS defined twice. Is this OK?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
