From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 10:58:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-13
In-Reply-To: <20140414084230.GD9805@tarshish>
References: <20140414063009.3F4A6100DD1@stock.ovh.net>
 <20140414065113.GB9805@tarshish> <20140414091533.1a0e16e5@skate>
 <20140414075801.GC9805@tarshish> <20140414103021.0168d7d3@skate>
 <20140414084230.GD9805@tarshish>
Message-ID: <20140414105816.322a1761@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 14 Apr 2014 11:42:30 +0300, Baruch Siach wrote:

> > #ifdef __USE_SVID
> > /* Determine whether the string value of RESPONSE matches the affirmation
> >    or negative response expression as specified by the LC_MESSAGES category
> >    in the program's current locale.  Returns 1 if affirmative, 0 if
> >    negative, and -1 if not matching.  */
> > extern int rpmatch (__const char *__response) __THROW __nonnull ((1)) __wur;
> > #endif
> 
> Seems to be a patched uClibc.

Yes, see uclibc-0033-rpmatch-backport-function.patch in Buildroot.

> > See
> > http://free-electrons.com/~thomas/pub/peko-i686-wchar-toolchain.tar.xz
> > for a tarball of the full toolchain. But you will most likely not be
> > able to use it: it's built to run on a PowerPC machine :)
> 
> So what is the correct solution for this?

The ideal solution would be to have a configure.ac test for rpmatch,
but unfortunately, mtd-utils do not use autoconf.

I believe we said that we should not include patches that add
functionality to uClibc, but it creates a difference between our
patched uClibc, and other toolchains that don't have the same patches
for uClibc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
