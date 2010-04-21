From: Microbit_P43000 <microbit@virginbroadband.com.au>
Date: Thu, 22 Apr 2010 08:06:08 +1000
Subject: [Buildroot] Still can't
	buildworkingrootfswith	crosstool-NGtoolchain
In-Reply-To: <hqngcu$47r$1@dough.gmane.org>
References: <hqhq8e$uau$1@dough.gmane.org><8D63FCBEC4B04D56B92C74260683A038@development><028801cae0e3$3ebe5720$bc3b0560$@com><5D7DDABC417D46CFACF64003BB0EBC2F@development><hqn0op$14i$1@dough.gmane.org><82069254E03F44CB90EDB741DB18CBF9@development><hqn98s$5sn$1@dough.gmane.org><8035C465416D4C9D8992B2CB364F236E@development>
	<hqngcu$47r$1@dough.gmane.org>
Message-ID: <E4945573C1804553A4F006C278CD23A2@development>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of
> Grant Edwards
> Sent: Thursday, 22 April 2010 4:33 AM
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] Still can't buildworkingrootfswith crosstool-NGtoolchain
> 
> On 2010-04-21, Microbit_P43000 <microbit@virginbroadband.com.au> wrote:
> 
> > Indeed, the time I mention is a complete make from scratch.
> > Xcompiler, utils, libc, busybox, rootfs, etc.... It doesn't have to
> > include the kernel, that takes all but 5 mins. This is on a P4 dual
> > CPU 3 GHz (albeit with only 1 GB ram).
> 
> The toolchain is probably 90+ percent of that.  I think you'll be far
> happier if you use an external toolchain.
> 
> > I've tried external tools like codesourcery (which I dislike) and
> > arm-elf-gcc and likes. Either I ran into sysroot problems, or their
> > were hissies being thrown about 90% through building, that sort of
> > stuff - yet again off a Sherlock Holmes to figure out in scripts
> > where these mysterious 'issues' come from.
> 
> AFAIK, most of the buildroot developers use external toolchains built
> by crosstools-NG (and that's what I'm now using), so that's probably
> the path of least resistance.  If you like, I can send you the
> crosstools-NG and uClibc config files I'm using for ARM9, but
> Crosstools-NG comes with quite a few sample configs -- one of them is
> probably pretty close to what you want.
> 
> Just pay close attention to ARM EABI vs. OABI.
> 
> --
> Grant Edwards               grant.b.edwards        Yow! As President I have
>                                   at               to go vacuum my coin
>                               gmail.com            collection!
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


That sounds great. Unless there's a pretty-close config for Olimex SAM9-L9260. But the
Atmel 9260EK is already as good as compatible. Small differences like CS1 vs. CS0 for
DataFlash
is taken care of in my own board file anyway.

The OABI drama, I recall that all right. The Olimex board was turnkey, but when I tried
basic user space code, 'twas always nasty page faults etc.
Then I realised that I needed to recompile the kernel to run EABI, that's what (the
included) codesourcery tool produced anyway.

I recall I looked at crosstools-NG, and it seemed a bit overwhelming at the start for
newbie like me.
If you have some sort of a kickstart config, it'd certainly be well appreciated. I still
need to learn, but at times it's like it's pushing the proverbial ** up hill :-)

** Peter : Interesting that the internal tool + packages builds that quick for you.
Perhaps I should underscore that I'm using Ubuntu 9.10 w/ kernel fixes. It's also a distro
x86 install. Perhaps a lot of my 3 GHz P4 CPU is being blown there, dunno.

Note : I can't readily try it ftm, I'm doing code w/ CrossWorks ARM for SAM7 under XP.
It's also painful that I couldn't find a way to get Ubuntu 9.10 to install as EXT3, rather
than EXT4. I like using Colinux if need really arises, but Colinux has no clue about EXT4
(yet, dunno ?)
I boot off a completely separate HDD for Linux. Eventually I'll upgrade, but that machine
still stands up really well when it runs XP.

Best regards,
Kris
