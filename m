From: Microbit_P43000 <microbit@virginbroadband.com.au>
Date: Thu, 22 Apr 2010 04:25:26 +1000
Subject: [Buildroot] Still can't build
	workingrootfswith	crosstool-NGtoolchain
In-Reply-To: <hqn98s$5sn$1@dough.gmane.org>
References: <hqhq8e$uau$1@dough.gmane.org><8D63FCBEC4B04D56B92C74260683A038@development><028801cae0e3$3ebe5720$bc3b0560$@com><5D7DDABC417D46CFACF64003BB0EBC2F@development><hqn0op$14i$1@dough.gmane.org><82069254E03F44CB90EDB741DB18CBF9@development>
	<hqn98s$5sn$1@dough.gmane.org>
Message-ID: <8035C465416D4C9D8992B2CB364F236E@development>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of
> Grant Edwards
> Sent: Thursday, 22 April 2010 2:31 AM
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] Still can't build workingrootfswith crosstool-NGtoolchain
> 
> On 2010-04-21, Microbit_P43000 <microbit@virginbroadband.com.au> wrote:
> 
> > That puts my soul at rest a bit... &:). Wish I posted this many
> > months ago, oh well... I have a copy of the 'dl' dir, re-extract BR,
> > re-copy the dl directory contents and re-import my configs for
> > everything and make.
> >
> > At one stage the whole cycle took ~ 1 hour 15 mins. Common sense had
> > to prevail I guess - it's just a lot faster than chasing ghosts - it
> > seems that your experience matches the observations I made.
> 
> If it's taking that long, I suspect you're also building a toolchain
> and kernel everytime.  When I realized that partial rebuilds weren't
> practical, I switched to using an external toolchain.  With an
> external toolchain and an external download directory, doing a
> from-scratch basic rootfs build takes about 6-7 minutes on a single
> CPU, 2GHz AMD Athlon64.
> 
> I also switched to building my kernel outside of buildroot.  If you're
> doing any sort of kernel development (or just want to try
> experimenting with kernel configurations), doing the kernel builds
> with buildroot is pretty clumsy.
> 
> Once you've got a kernel configuration figured out and set in stone,
> it could be useful to have the kernel built by buildroot, but it
> doesn't seem to be a paractical way to do kernel development.
> 
> --
> Grant Edwards               grant.b.edwards        Yow! PARDON me, am I
>                                   at               speaking ENGLISH?
>                               gmail.com
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Indeed, the time I mention is a complete make from scratch. Xcompiler, utils, libc,
busybox, rootfs, etc.... It doesn't have to include the kernel, that takes all but 5 mins.
This is on a P4 dual CPU 3 GHz (albeit with only 1 GB ram).

I've tried external tools like codesourcery (which I dislike) and arm-elf-gcc and likes.
Either I ran into sysroot problems, or their were hissies being thrown about 90% through
building, that sort of stuff - yet again off a Sherlock Holmes to figure out in scripts
where these mysterious 'issues' come from.
I can't recall - surely I must have been doing something wrong, I guess. (I've come across
clear bugs on a couple of occasions, eg. I've got 32 bit EABI and some package (Lynx with
the latest SSL extensions IIRC) incorrectly gets a perceived 64 bit environment from host
instead of target settings.... More whinging yet again that uclibc is compiled for 32 bit
only - that sort of crap.
I need to revisit getting ext tool working for me again soon.  But yes, when I get back to
that, I really have to get the ext tool going.

Thanks for the insights, Grant - much appreciated, I'll post again when I get my feet back
under desk for linux cross-compile.

Maybe a note to the authors of Buildroot here that this doesn't mean I'm not appreciating
all their effort - on the contrary ! This surely must be a massive effort which I guess
could seem thankless, given all the 'problem traffic' on here.
Too much to learn anyhoo I say :-)

Best Regards,
Kris
