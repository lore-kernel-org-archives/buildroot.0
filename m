From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 13 Nov 2013 17:42:58 -0600
Subject: [Buildroot] [PATCH v3 6/7] toolchain: uclibc does not support
	microblze
In-Reply-To: <20131114002035.68f41c38@skate>
References: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
 <1384378130-8599-7-git-send-email-spenser@gillilanding.com>
 <20131113225819.56b10ada@skate>
 <1384382133.11719.5.camel@scotch.dyn.gillilanding.com>
 <20131114002035.68f41c38@skate>
Message-ID: <CAEBucnD_jk9UHdf=7L9XkMKNoeyF6hOiB-3mkXh2vMTKvs37oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Nov 13, 2013 5:20 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Spenser Gilliland,
>
> On Wed, 13 Nov 2013 16:35:33 -0600, Spenser Gilliland wrote:
>
> > > >   select BR2_TOOLCHAIN_USES_UCLIBC
> > > > + depends on !BR2_microblaze
> > >
> > > Hum, I see a libc/sysdeps/linux/microblaze in my uClibc tree. And
also,
> > > since there are some no-MMU variant of Microblaze processors, which C
> > > library other than uClibc could they use?
> >
> > In the distant past there may have been a version of uclibc that worked
> > with microblaze.  However from my limited testing, the current toolchain
> > does not work with uclibc.
>
> Ok. But then which C library are Microblaze non-MMU users using?

Likely a version from petalinux.  This needs to be investigated further to
see if uclibc support is possible with newer toolchains and any patches
from petalinux.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131113/7d8f4a8b/attachment.html>
