From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 21:22:09 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/makedumpfile: new package
In-Reply-To: <87v9gsus6t.fsf@posteo.net>
References: <20200831111226.15764-1-egorenar-dev@posteo.net>
 <20200903232648.6be84338@windsurf.home> <87y2louth0.fsf@posteo.net>
 <87v9gsus6t.fsf@posteo.net>
Message-ID: <20200905212209.1e476db9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 05 Sep 2020 18:03:22 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> > Hmm, i checked the usr/include/linux/elf.h and it defines
> > PN_XNUM but makedumpfile doesn't include this one and takes the one from
> > glibc which is much bigger but doesn't contain this define,
> > unfortunately. One option would be to patch makedumpfile and define
> > PN_XNUM if it not yet defined, not sure whether this the way you want to
> > go ? At least we wouldn't possibly break any other packages. What do you
> > think ?
> > This is just stupid, why would elfutils override glibc's elf.h, sigh.
> 
> I checked glibc and it defines the PN_XNUM constant, it seems that
> uClibc doesn't. Another possible solution would be to make makedumpfile
> depend on glibc, what do you think ? That would mean no uClibc support
> for this package.

Indeed, I hadn't noticed that glibc and musl define PN_XNUM, but not
uClibc. Good catch.

I guess the simplest then is to do what OpenSuse is doing:
https://build.opensuse.org/package/view_file/Kernel:kdump/makedumpfile/makedumpfile-PN_XNUM.patch?expand=1.
I had already seen it, found it not a great solution, but it's indeed
the simplest.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
