From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 10 Feb 2015 18:25:55 +0100
Subject: [Buildroot] [PATCH] add basic support for uClibc-ng
In-Reply-To: <20150209205338.604f740e@free-electrons.com>
References: <20150209181636.GA17451@waldemar-brodkorb.de>
 <20150209205338.604f740e@free-electrons.com>
Message-ID: <20150210172555.GE22344@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Mon, 9 Feb 2015 19:16:37 +0100, Waldemar Brodkorb wrote:
> 
> > +config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
> > +	bool "uClibc-ng"
> > +	select BR2_TOOLCHAIN_USES_UCLIBC
> > +	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
> > +		   BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \
> > +		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> > +		   BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
> > +		   BR2_x86_64
> > +	help
> > +	  This option selects uClibc-ng as the C library for the
> > +	  cross-compilation toolchain.
> > +
> > +	  http://uclibc-ng.org
> > +
> 
> I don't think introducing this symbol is needed. Instead, we can just
> make uClibc-ng another version of uClibc. Like the following (untested) :

I thought about this in my first try, but I have following problem:
When you choose uClibc-ng 1.0.0 instead of uClibc, the default
config string is _not_ automatically changed.

How could this be done?

best regards
 Waldemar
