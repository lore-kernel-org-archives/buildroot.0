From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 9 Sep 2013 21:16:47 +0800
Subject: [Buildroot] GTK+ for framebuffer?
In-Reply-To: <20130909090808.7513d104@skate>
References: <20130903100905.GA324@zuhnb712.ap.bm.net>
 <20130903133145.370bb2d4@skate>
 <20130904024019.GA875@zuhnb712.ap.bm.net>
 <20130904093510.031f559b@skate>
 <20130905060235.GA15735@zuhnb712.ap.bm.net>
 <20130905091054.51fd4ce0@skate>
 <20130909013956.GA15333@zuhnb712.ap.bm.net>
 <20130909090808.7513d104@skate>
Message-ID: <20130909131647.GA4041@zuhnb712>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 09, 2013 at 09:08:08AM +0200, Thomas Petazzoni wrote:
> Dear Woody Wu,
> 
> On Mon, 9 Sep 2013 09:39:56 +0800, Woody Wu wrote:
> 
> > I've already have Xfbdev started. Thanks for your help. But I have not
> > yet figured out a right way to pass my touchscreen device
> > (/dev/input/event0) to Xfbdev.  I tried something like "-mouse
> > evdev,,..." and "-mouse tslib,,..." but always got strange warning
> > messages.  Maybe you have experience on this.
> 
> Here is known-working command line I was using to run Xfbdev under Qemu:
> 
>   Xfbdev -keybd evdev,,device=/dev/input/event0 -mouse evdev,,device=/dev/input/event1 &
> 

Thanks for the example. Finally I found my command line was correct (I
used tslib and has not yet tried evdev with success), the problem
actually came from a xorg server bug in version 1.12.4 (which is used by
buildroot 2013.08).  I just fixed the bug in xorg and posted a patch on
this list. The bug make the the xserver option such as "device=xxxx" is
parsed as (key=device=, value=xxxx), but it should be (key=device,
value=xxxx).

Because of this bug, whatever way I tried, I always cannot get Xfbdev
started correctly.

BTW:  before I am going to try 'evdev', would you tell me what's the
major difference between using 'evdev' and 'tslib' for my touchscreen?
Which way is better?  Thanks.

Cheers,
woody


> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

-- 
I can't go back to yesterday - because I was a different person then
