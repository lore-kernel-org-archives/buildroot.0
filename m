From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Nov 2012 15:43:17 +0200
Subject: [Buildroot] [PATCH v3] libusb: disable on avr32
In-Reply-To: <CAHt8ZCMA8fQOQMu9QerQfA1Vye+WKaCo5MmQBEdDhdYjkBX--Q@mail.gmail.com>
References: <1353243578-6980-1-git-send-email-spdawson@gmail.com>
 <20121118130836.GE25380@sapphire.tkos.co.il>
 <20121118131245.GF25380@sapphire.tkos.co.il>
 <CAHt8ZCMA8fQOQMu9QerQfA1Vye+WKaCo5MmQBEdDhdYjkBX--Q@mail.gmail.com>
Message-ID: <20121118134316.GG25380@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Sun, Nov 18, 2012 at 01:23:49PM +0000, Simon Dawson wrote:
> On 18 November 2012 13:12, Baruch Siach <baruch@tkos.co.il> wrote:
> >> >  comment "ccid needs a toolchain with thread support"
> >> > -   depends on !BR2_TOOLCHAIN_HAS_THREADS
> >> > +   depends on !BR2_TOOLCHAIN_HAS_THREADS && !BR2_avr32
> >>
> >> Showing this comment when BR2_avr32 is enabled is not very helpful, IMHO,
> >> especially when the toolchain does have threads support.
> >
> > Replying to myself: was the intension here to say
> >
> >     depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_avr32
> >
> > ? Otherwise it doesn't make much sense either. Or am I missing something here?
> 
> The ccid package is unavailable for avr32, and requires thread support
> in the toolchain. However, it is my understanding that current
> "policy" in Buildroot is not to display comments for packages that are
> not available for the currently-selected target architecture. That is
> why the thread-related comment is only visible if the target
> architecture is not avr32.

I see. Thanks for the explanation.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
