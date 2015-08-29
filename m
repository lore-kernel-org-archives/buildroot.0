From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:11:36 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: add sparc64 architecture
 support
In-Reply-To: <20150829074104.GB8475@waldemar-brodkorb.de>
References: <20150811203709.GA9885@waldemar-brodkorb.de>
 <20150828202224.2f12a93c@free-electrons.com>
 <20150829074104.GB8475@waldemar-brodkorb.de>
Message-ID: <20150829101136.02a50aec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sat, 29 Aug 2015 09:41:04 +0200, Waldemar Brodkorb wrote:

> Yeah, the main reason providing the patch is to discover portability
> issues in software packages for this platform. I like the
> autobuilder stuff and a greater test coverage is useful in my
> opinion.

Ok, no problem.

> There is already ppc64-pseries, which isn't an embedded system or do
> I missed something? :=)

Yes, it was contributed by IBM IIRC, so we kind of assumed they would
be around to fix issues if any (though in practice we have not yet
added a PowerPC 64 toolchain configuration in the autobuilders, so my
comment is a bit moot as we have never tested the reactivity of the IBM
guys).

> > >  config BR2_ENDIAN
> > >  	default "BIG"
> > > @@ -20,3 +24,4 @@ config BR2_ENDIAN
> > >  config BR2_GCC_TARGET_CPU
> > >  	default "leon3"		if BR2_sparc_leon3
> > >  	default "v8"		if BR2_sparc_v8
> > > +	default "ultrasparc"	if BR2_sparc_v9
> > 
> > Why not using v9 here? It's a valid -mcpu value:
> 
> Valid, but not useful for Linux:
> http://permalink.gmane.org/gmane.comp.lib.glibc.alpha/10649

So maybe the option should be called v9a, rather than just v9 ? Or just
Ultrasparc so it matches the name of the gcc -mcpu option ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
