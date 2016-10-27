From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 09:56:07 +0200
Subject: [Buildroot] Autobuilder for powerpc64le?
In-Reply-To: <20161027035203.GA2558@tungsten.ozlabs.ibm.com>
References: <20161026051532.GA13988@tungsten.ozlabs.ibm.com>
 <20161026091227.7eb2f99f@free-electrons.com>
 <20161027035203.GA2558@tungsten.ozlabs.ibm.com>
Message-ID: <20161027095607.4fdc7bc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Oct 2016 14:52:03 +1100, Sam Bobroff wrote:

> > I'd say that both are useful, though (2) looks more interesting to me.  
> 
> At the moment, it's (2), although I might eventually try to get (1) going as
> well.

OK.

> >  (2) Requires adding some base toolchain configurations in
> >      https://git.buildroot.org/buildroot-test/tree/web/toolchains/configs/.
> >      One .config file per toolchain configuration, and each of them
> >      should be referenced in toolchain-configs.csv.  
> 
> OK! It's (2), so what do I need do next? Do I need to create the configs or
> provide you with some info? (If it's me, are there instructions somewhere?)

You clone the Git repository at
https://git.buildroot.org/buildroot-test/, add new .config files in
web/toolchains/configs/, and reference them in
web/toolchains/configs/toolchain-configs.csv, and then send patches on
the Buildroot mailing list, as usual.

> Oh, also, how are the pre-built toolchains managed? I notice that some of the
> configs use them and some don't. Can we create ones for the new targets?

Yes, we can. In this case, just provide me the base Buildroot
configuration for those targets, and I'll build the toolchains
accordingly.

Do you want just powerpc64/glibc and powerpc64el/glibc, or are there
other interesting C libraries supporting powerpc64 that we should test ?

> > Also, if you're interested in powerpc64 and powerpc64le and we indeed
> > add toolchain configurations in the autobuilders, it would be nice if
> > you could add:
> > 
> > N:	Sam Bobroff <sam.bobroff@au1.ibm.com>
> > F:	arch/Config.in.powerpc
> > 
> > to the DEVELOPERS file. This way, you will receive a daily e-mail with
> > the failures that occurred on powerpc, powerpc64 and powerpc64le (i.e
> > all BR2_ARCH values described in arch/Config.in.powerpc).  
> 
> I can only help with powerpc64 and powerpc64le, if that's OK then I'm happy to
> add myself. I can probably find someone else around here to put their hand up
> too. Should I just send a buildroot patch with the change?

We currently don't have a way of expressing interest only for powerpc64
but not powerpc. Is it fine if you get both results?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
