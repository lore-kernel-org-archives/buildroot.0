From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 21 Apr 2010 18:33:02 +0000 (UTC)
Subject: [Buildroot] Still can't build
	workingrootfswith	crosstool-NGtoolchain
References: <hqhq8e$uau$1@dough.gmane.org>
	<8D63FCBEC4B04D56B92C74260683A038@development>
	<028801cae0e3$3ebe5720$bc3b0560$@com>
	<5D7DDABC417D46CFACF64003BB0EBC2F@development>
	<hqn0op$14i$1@dough.gmane.org>
	<82069254E03F44CB90EDB741DB18CBF9@development>
	<hqn98s$5sn$1@dough.gmane.org>
	<8035C465416D4C9D8992B2CB364F236E@development>
Message-ID: <hqngcu$47r$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-21, Microbit_P43000 <microbit@virginbroadband.com.au> wrote:

> Indeed, the time I mention is a complete make from scratch.
> Xcompiler, utils, libc, busybox, rootfs, etc.... It doesn't have to
> include the kernel, that takes all but 5 mins. This is on a P4 dual
> CPU 3 GHz (albeit with only 1 GB ram).

The toolchain is probably 90+ percent of that.  I think you'll be far
happier if you use an external toolchain.

> I've tried external tools like codesourcery (which I dislike) and
> arm-elf-gcc and likes. Either I ran into sysroot problems, or their
> were hissies being thrown about 90% through building, that sort of
> stuff - yet again off a Sherlock Holmes to figure out in scripts
> where these mysterious 'issues' come from.

AFAIK, most of the buildroot developers use external toolchains built
by crosstools-NG (and that's what I'm now using), so that's probably
the path of least resistance.  If you like, I can send you the
crosstools-NG and uClibc config files I'm using for ARM9, but 
Crosstools-NG comes with quite a few sample configs -- one of them is
probably pretty close to what you want.

Just pay close attention to ARM EABI vs. OABI.

-- 
Grant Edwards               grant.b.edwards        Yow! As President I have
                                  at               to go vacuum my coin
                              gmail.com            collection!
