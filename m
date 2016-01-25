From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:59:12 +0100
Subject: [Buildroot] [PATCH 3/8] mongrel2: allow using uClibc but only
 on certain architectures
In-Reply-To: <56A6A489.70105@gmail.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A6A489.70105@gmail.com>
Message-ID: <20160125235912.733d00ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, 25 Jan 2016 23:41:13 +0100, Romain Naour wrote:

> > +# mongrel2 uses {get,make,swap}context() functions, which are
> > +# available in glibc for all architectures and in uClibc only for a
> > +# subset of the architectures
> > +config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
> > +	bool
> > +	default y if BR2_TOOLCHAIN_USES_GLIBC
> > +	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
> > +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_x86_64)
> 
> In the libunwind patch BR2_mips64 and BR2_mips64el where dropped from the
> libunwind's supported architecture. Why they are not here ?

I just tested, and I was able to build libunwind on mips64el with
uClibc, so it seems like my libunwind patch is incorrect in that
respect.

I'll fix that up in the v2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
