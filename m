From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 21:04:20 +0100
Subject: [Buildroot] [PATCH 01/21] libftdi: C++ bindings need boost
In-Reply-To: <20160125170438.GB3386@free.fr>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160125170438.GB3386@free.fr>
Message-ID: <20160125210420.205d1502@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jan 2016 18:04:38 +0100, Yann E. MORIN wrote:

> >  config BR2_PACKAGE_LIBTFDI_CPP
> > -	depends on BR2_INSTALL_LIBSTDCPP
> >  	bool "C++ bindings"
> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> > +	depends on BR2_USE_WCHAR
> > +	select BR2_PACKAGE_BOOST
> 
> boost also has a threads dependency, but that is covered by the main
> symbol, because of libusb.
> 
> I wonder if we should duplicate the dependency here, with another
> comment, like:
> 
>     depends on BR2_TOOLCHAIN_HAS_THREADS # Boost
> 
> Or at least state it in a comment:
> 
>     # Boost depends on threads, but that's already accounted for
>     # in the main symbol because of libusb.

We don't have clear rules about what to do in such situations. We
sometimes say to duplicate the dependencies, but sometimes it looks
really really annoying to duplicate all those dependencies when you
*know* that the top-level package can anyway not be enabled in this or
that situation.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
