From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 08:59:59 +0100
Subject: [Buildroot] [PATCH] autofs: use libtirpc instead of internal C
 implementation
In-Reply-To: <20170322020946.GF28589@waldemar-brodkorb.de>
References: <20170321193213.GA18747@waldemar-brodkorb.de>
 <20170321222449.5ceb21f4@free-electrons.com>
 <20170322020946.GF28589@waldemar-brodkorb.de>
Message-ID: <20170322085959.587a9f22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 03:09:46 +0100, Waldemar Brodkorb wrote:

> > On Tue, 21 Mar 2017 20:32:13 +0100, Waldemar Brodkorb wrote:
> >   
> > > @@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
> > >  	bool "autofs"
> > >  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> > >  	depends on BR2_USE_MMU
> > > -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> > >  	depends on !BR2_STATIC_LIBS # dlfcn
> > > +	select BR2_PACKAGE_LIBTIRPC  
> > 
> > Why should we force people to use libtirpc ?   
> 
> Because the internal RPC implementation is mostly useless and
> getting removed?

I don't quite agree. The one in glibc has been used for years
successfully, and is still useful. So even if uClibc decides to remove
its internal RPC implementation, I'd like to give people the option to
use the internal RPC implementation of glibc.

I agree RPC support in glibc will most likely disappear at some point
in the future, but we're not there yet. So for now, I'd prefer if we
just took the step of dropping RPC support in uClibc, and doing the
necessary changes in packages so that they all build/work fine with
libtirpc. That's anyway a very good preparation step to get rid of
internal RPC support entirely at some point in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
