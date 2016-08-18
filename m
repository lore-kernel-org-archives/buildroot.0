From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:18:50 +0200
Subject: [Buildroot] BuildRoot cannot build powerpc64
In-Reply-To: <532ce6e0-de27-9a2a-f062-179a4fa3248e@mind.be>
References: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
 <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
 <F9C551623D2CBB4C9488801D14F864C6EE8B17ED@ex-mb1.corp.adtran.com>
 <20160817193721.0cc1466d@free-electrons.com>
 <532ce6e0-de27-9a2a-f062-179a4fa3248e@mind.be>
Message-ID: <20160818231850.4072ddf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 20:02:31 +0200, Arnout Vandecappelle wrote:

> > The only C library that supports PowerPC64 today is glibc.
> > 
> > But glibc does not support static linking.
> > 
> > Hence there is no solution to do a statically linked rootfs on
> > PowerPC64 today.  
> 
>  Perhaps we should remove the static/shared libs options to the toolchain menu,
> and make them depend on the libc choice rather than the other way round. That
> way, we're sure that we never run into such impossible situations.
> 
>  Actually also some other options are more fitting in the toolchain menu IMHO,
> like debug/optimization options and SSP.

I personally don't like this, and instead would like to keep separated
the options that affect the build of all components (SSP or not,
debug/optimization, shared/static) from the options that configure the
toolchain itself.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
