From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:31:50 +0200
Subject: [Buildroot] [PATCH] gcc: bump 7.x series to 7.2.0
In-Reply-To: <ad90209d-973e-b3e4-fb76-854f6bbb01e9@mind.be>
References: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
 <ad90209d-973e-b3e4-fb76-854f6bbb01e9@mind.be>
Message-ID: <20170821233150.28c91c2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Aug 2017 00:17:56 +0200, Arnout Vandecappelle wrote:

> > @@ -18,9 +18,9 @@ GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
> >  GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
> >  else
> >  GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
> > -# From version 6.4.0 a bz2 release tarball is not provided anymore. Use the xz
> > -# tarball instead.
> > -ifeq ($(BR2_GCC_VERSION_6_X),y)
> > +# From version 6.4.0 and 7.2.0 a bz2 release tarball is not provided
> > +# anymore. Use the xz tarball instead.
> > +ifeq ($(BR2_GCC_VERSION_6_X)$(BR2_GCC_VERSION_7_X),y)  
> 
>  This is not maintainable, at some point we'll have to change it into
> BR2_TOOLCHAIN_GCC_AT_LEAST_6.

Agreed, but I've kept that for a future change. In the future, most gcc
tarballs will be .tar.xz, so what we'll have to special case are the
older versions, not the newer ones :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
