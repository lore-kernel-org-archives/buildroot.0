From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Apr 2014 12:07:13 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-13
In-Reply-To: <20140414105816.322a1761@skate>
References: <20140414063009.3F4A6100DD1@stock.ovh.net>
 <20140414065113.GB9805@tarshish> <20140414091533.1a0e16e5@skate>
 <20140414075801.GC9805@tarshish> <20140414103021.0168d7d3@skate>
 <20140414084230.GD9805@tarshish> <20140414105816.322a1761@skate>
Message-ID: <20140414090713.GE9805@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 14, 2014 at 10:58:16AM +0200, Thomas Petazzoni wrote:
> On Mon, 14 Apr 2014 11:42:30 +0300, Baruch Siach wrote:
> 
> > > #ifdef __USE_SVID
> > > /* Determine whether the string value of RESPONSE matches the affirmation
> > >    or negative response expression as specified by the LC_MESSAGES category
> > >    in the program's current locale.  Returns 1 if affirmative, 0 if
> > >    negative, and -1 if not matching.  */
> > > extern int rpmatch (__const char *__response) __THROW __nonnull ((1)) __wur;
> > > #endif
> > 
> > Seems to be a patched uClibc.
> 
> Yes, see uclibc-0033-rpmatch-backport-function.patch in Buildroot.
> 
> > > See
> > > http://free-electrons.com/~thomas/pub/peko-i686-wchar-toolchain.tar.xz
> > > for a tarball of the full toolchain. But you will most likely not be
> > > able to use it: it's built to run on a PowerPC machine :)
> > 
> > So what is the correct solution for this?
> 
> The ideal solution would be to have a configure.ac test for rpmatch,
> but unfortunately, mtd-utils do not use autoconf.
> 
> I believe we said that we should not include patches that add
> functionality to uClibc, but it creates a difference between our
> patched uClibc, and other toolchains that don't have the same patches
> for uClibc.

Unfortunately this patch is queued in the 0.9.33 branch. This means the 
when/if version 0.9.33.3 is released it will break my fix. The only 
alternative I see is to just patch the rpmatch() call out of mtd-utils. I'm 
not sure upstream would like this solution though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
