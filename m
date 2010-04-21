From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 21 Apr 2010 16:31:24 +0000 (UTC)
Subject: [Buildroot] Still can't build working
	rootfswith	crosstool-NGtoolchain
References: <hqhq8e$uau$1@dough.gmane.org>
	<8D63FCBEC4B04D56B92C74260683A038@development>
	<028801cae0e3$3ebe5720$bc3b0560$@com>
	<5D7DDABC417D46CFACF64003BB0EBC2F@development>
	<hqn0op$14i$1@dough.gmane.org>
	<82069254E03F44CB90EDB741DB18CBF9@development>
Message-ID: <hqn98s$5sn$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-21, Microbit_P43000 <microbit@virginbroadband.com.au> wrote:

> That puts my soul at rest a bit... &:). Wish I posted this many
> months ago, oh well... I have a copy of the 'dl' dir, re-extract BR,
> re-copy the dl directory contents and re-import my configs for
> everything and make.
>
> At one stage the whole cycle took ~ 1 hour 15 mins. Common sense had
> to prevail I guess - it's just a lot faster than chasing ghosts - it
> seems that your experience matches the observations I made.

If it's taking that long, I suspect you're also building a toolchain
and kernel everytime.  When I realized that partial rebuilds weren't
practical, I switched to using an external toolchain.  With an
external toolchain and an external download directory, doing a
from-scratch basic rootfs build takes about 6-7 minutes on a single
CPU, 2GHz AMD Athlon64.

I also switched to building my kernel outside of buildroot.  If you're
doing any sort of kernel development (or just want to try
experimenting with kernel configurations), doing the kernel builds
with buildroot is pretty clumsy.

Once you've got a kernel configuration figured out and set in stone,
it could be useful to have the kernel built by buildroot, but it
doesn't seem to be a paractical way to do kernel development.

-- 
Grant Edwards               grant.b.edwards        Yow! PARDON me, am I
                                  at               speaking ENGLISH?
                              gmail.com            
