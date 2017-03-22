From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 22 Mar 2017 03:09:46 +0100
Subject: [Buildroot] [PATCH] autofs: use libtirpc instead of internal C
 implementation
In-Reply-To: <20170321222449.5ceb21f4@free-electrons.com>
References: <20170321193213.GA18747@waldemar-brodkorb.de>
 <20170321222449.5ceb21f4@free-electrons.com>
Message-ID: <20170322020946.GF28589@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Tue, 21 Mar 2017 20:32:13 +0100, Waldemar Brodkorb wrote:
> 
> > @@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
> >  	bool "autofs"
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >  	depends on BR2_USE_MMU
> > -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> >  	depends on !BR2_STATIC_LIBS # dlfcn
> > +	select BR2_PACKAGE_LIBTIRPC
> 
> Why should we force people to use libtirpc ? 

Because the internal RPC implementation is mostly useless and
getting removed?

> What about instead:
> 
> 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> 
> and adjust the .mk file accordingly.

The idea was to entirely remove BR2_TOOLCHAIN_HAS_NATIVE_RPC in
further patches. This would involve to disable deprecated RPC in
internal Glibc and uClibc-ng toolchains. 
I think RPC support in external toolchains will disappear when
GNU C library will finally remove the code.

best regards
 Waldemar 
