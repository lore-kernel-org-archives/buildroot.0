From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 15:48:58 +0200
Subject: [Buildroot] [PATCH 06/36] package/usbredir: new package
In-Reply-To: <201208171537.54259.yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-6-git-send-email-yann.morin.1998@free.fr>
 <20120817131558.77a46760@skate>
 <201208171537.54259.yann.morin.1998@free.fr>
Message-ID: <20120817154858.797b4dbe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Aug 2012 15:37:53 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> > Another note: have you looked at the uClibc compatibility of all these
> > new packages, regarding things like wchar, locale, largefile, ipv6 and
> > al. ?
> 
> I'm building with uClibc, but granted, that's a full-featured config.
> 
> I'll test further with a stripped-down config to see what's missing.

Ok, thanks!

> I at least know of one of the packages that requires SSP in the libc, but I
> think there's no such knob in BR for now.

We have BR2_TOOLCHAIN_BUILDROOT_USE_SSP in the internal backend.

If one package requires SSP support, it's going to be a pain with
external toolchains that may not have enabled this feature. How is it
possible that a package requires such mechanism?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
