From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 22:17:07 +0200
Subject: [Buildroot] [PATCH] gcc: bump 6.x series to version 6.4.0
In-Reply-To: <20170710122941.26082-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 10 Jul 2017 14:29:41 +0200")
References: <20170710122941.26082-1-joerg.krause@embedded.rocks>
Message-ID: <87wp7eranw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Drop the following patches:
 >   * the Xtensa patches 870 and 871 are upstream now
 >   * patch 942 was backported from GCC 6 branch

I take it that you mean 'to GCC 6 branch'?

That seems to be correct. E.G. the fix on trunk:

https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=239971

And the backport on the gcc 6 branch:

https://gcc.gnu.org/viewcvs/gcc?view=revision&sortby=date&revision=244923

Committed with that fixed, thanks!

 >  GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 > +# From version 6.4.0 a bz2 release tarball is not provided anymore. Use the xz
 > +# tarball instead.
 > +ifeq ($(BR2_GCC_VERSION_6_X),y)
 > +GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
 > +else

If this is how all new gcc releases will be done, then we probably want
to invert the test in the future, but for now this will do.

-- 
Bye, Peter Korsgaard
