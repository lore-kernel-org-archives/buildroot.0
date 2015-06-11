From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Jun 2015 17:11:27 +0200
Subject: [Buildroot] Kernel zImage under 1MB
In-Reply-To: <CADMiy=JBW02jQ2wfEJGR8i5TyjRq8_Q62k2VttP0xADn9_w9zw@mail.gmail.com>
 (Michal Gonda's message of "Thu, 11 Jun 2015 16:39:53 +0200")
References: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
 <87pp54jzw1.fsf@dell.be.48ers.dk>
 <CADMiy=JZSro09MASQy51wKeDy2uES0D-kWwNgtL95s6z1AmxrA@mail.gmail.com>
 <87lhfsj7ro.fsf@dell.be.48ers.dk>
 <CADMiy=JBW02jQ2wfEJGR8i5TyjRq8_Q62k2VttP0xADn9_w9zw@mail.gmail.com>
Message-ID: <87mw06i8kg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michal" == Michal Gonda <gonda.miso@gmail.com> writes:

Hi,

 >> 6MB? I thought you said 1MB for kernel+rootfs? 6MB is a lot more doable
 >> with minimal effort.

 > No around 1MB for kernel and than I would like to have more space for
 > rootfs (aplications and services like openVPN, zeroMQ, less crippled
 > busybox etc.)
 > And since I dont need support for all the optional drivers why not to
 > remove them (but I was not sure how to do that, now it is much more clearer)

Ok.

 >> 
 >> > But what you described is exactly what I need to accomplish.
 >> > A static uClibc based build with busybox +
 >> > dropbear as smallest possible image is perfect.
 >> > As you said I can drop probably more later on but few kB here and there
 >> if
 >> > kernel is ~1MB is perfect.
 >> > Even better ~450kB as you did.
 >> 
 >> Notice that the 450KB was for the rootfs. I don't know how big your
 >> socfgpa kernel image is, but I would guess it is significantly bigger
 >> than 1MB even with XZ compression?


 > If I build it with default settings, uImage is 3,5MB and rootfs around 5MB.
 > I am tinkering around but getting kernel panic :D

5MB for the rootfs? I guess that's with openvpn/zeromq and so on? A
basic (static only) rootfs with only busybox and dropbear should give
you ~450KB like I mentioned.

But no matter what, you'll need to get the kernel significantly smaller
than in is now otherwise it is all moot.

And yes, as I mentioned in my first mail, I think squeezing the kernel
down to < 1MB while still providing the needed features isn't going to
be trivial.

-- 
Venlig hilsen,
Peter Korsgaard 
