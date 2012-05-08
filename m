From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 8 May 2012 08:15:03 +0300
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <20120507160406.137b4798@skate>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
 <20120507110012.GB8916@sapphire.tkos.co.il>
 <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
 <20120507154541.325b298d@skate>
 <20120507135519.GE8916@sapphire.tkos.co.il>
 <20120507160406.137b4798@skate>
Message-ID: <20120508051503.GB27257@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 07, 2012 at 04:04:06PM +0200, Thomas Petazzoni wrote:
> Le Mon, 7 May 2012 16:55:19 +0300,
> Baruch Siach <baruch@tkos.co.il> a ?crit :
> 
> > > 	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)
> > > -D__i386__" -C $(@D) all
> > 
> > But then you'll have CFLAGS defined twice. Is this OK?
> 
> You'll have a first definition of CFLAGS in TARGET_CONFIGURE_OPTS,
> overriden by the local redefinition. We do this in numerous places in
> Buildroot already.

Is this make behaviour documented? I couldn't find any mention of this in the 
manual.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
