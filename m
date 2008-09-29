From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 29 Sep 2008 14:35:11 +0200
Subject: [Buildroot] xkb.c:2169: relocation truncated to fit
In-Reply-To: <49ED01FC03EE524BB7BB258E8F93BFF32B272D@bfl-exchange-1.BFL.local>
References: <49ED01FC03EE524BB7BB258E8F93BFF32B26FF@bfl-exchange-1.BFL.local>
	<20080929140622.4823d684@atmel.com>
	<49ED01FC03EE524BB7BB258E8F93BFF32B272D@bfl-exchange-1.BFL.local>
Message-ID: <20080929143511.754c35a6@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Sep 2008 14:28:17 +0200
"Matuschka, Sebastian" <Sebastian.Matuschka@gcd-solutions.de> wrote:

<snipp>

> /atmel/buildrootBT/build_avr32/xserver_xorg-server-1.4.1/xkb/xkb.c:2169:
> > > relocation truncated to fit: R_AVR32_9UW_PCREL against
> > > `.text'+865c
> > 
> > Here, relocation truncated to fit.
> 
> Ok, but I can't really imagine what relocation truncated to fit
> means. I have read that it has to do something with the memory areas
> and that the target is too far away in memory. One solution they said
> somewhere would be to add -fPIC to the compiler flags. I have not
> found the point where I had to add this. It should be some
> Makefile.in in the xserver package I guess, but I had no success yet.
> 

You got the basics of it, adding PIC will probably help, although this
should be enabled by default for -O2, but I see you have -Os set as
well in the flags to GCC. Try adding -mrelax and see what happens.

<snipp>

> > Which snapshot version are you using? And which toolchain does that
> > snapshot version use?
> It's the snapshot version 23454. It uses the toolchain "AVR32
> gcc-4.2.1". The 4.2.2 version didn't work for me.
> 

What does not work? 4.2.2 works fine for me, and it is the latest
toolchain from Atmel. Although you must use the toolchain generated
with all the fixes applied (like Buildroot for AVR32 v2.2.0 does).

> > AFAIK the toolchain built by uclibc.org Buildroot is not that
> > optimal, I would recommend for now to use the toolchain from
> > Buildroot for AVR32. Hopefully some bright day in the future the
> > toolchain patches will be very small so it is easy to use
> > uclibc.org Buildroot.
> Do you mean to use the whole Buildroot package from Atmel or just the
> toolchain?

You could try to spin the entire Buildroot package from Atmel, since it
is based on a fairly new snapshot (20080924 IIRC).

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
