From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 May 2012 15:59:38 +0300
Subject: [Buildroot] [PATCH 2/2] Adjust v86d.mk per better source URL
 and build method.
In-Reply-To: <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
References: <1336386538-27684-1-git-send-email-golubovsky@gmail.com>
 <1336386538-27684-2-git-send-email-golubovsky@gmail.com>
 <20120507110012.GB8916@sapphire.tkos.co.il>
 <CADiAo4KbCYq7YbV7MN3duW+wWXpGhnP77Sk+=PJD5t=71=COYg@mail.gmail.com>
Message-ID: <20120507125937.GD8916@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dimitry,

On Mon, May 07, 2012 at 08:47:10AM -0400, Dimitry Golubovsky wrote:
> On Mon, May 7, 2012 at 7:00 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> >> ?# v86d's configure script is not autoconf-based: parameters
> >> ?# supplied by Buildroot cause it to produce no result; explicit
> >> ?# invocation is needed.
> >
> > Since you don't use Buildroot's autoconf support, this comment is no longer
> > relevant.
> 
> Well, I thought this would be the explanation why there is a configure
> script, yet it is a GENTARGET.

The comment needs to be reworded, then. Something like: "v86d's configure 
script is not autoconf-based, so we use GENTARGET".

> >> +
> >> +define V86D_BUILD_CMDS
> >> + ? ? $(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
> >
> > You can used $(TARGET_CONFIGURE_OPTS) here as well.
> 
> I tried that, and it did not compile. -D__i386__ should be given
> explicitly to cc.

Ah, you're right. I haven't noticed the quotes delimiting the CC variable.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
