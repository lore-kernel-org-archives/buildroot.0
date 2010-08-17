From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 17 Aug 2010 11:54:11 +0100
Subject: [Buildroot] linux26 in package dependency does not build linux
In-Reply-To: <1281956076.13866.97.camel@dubciaranr1.verifone.com>
References: <1281725350.13866.77.camel@dubciaranr1.verifone.com>
	<1281739934.9379.4.camel@coalu.atr>
	<1281956076.13866.97.camel@dubciaranr1.verifone.com>
Message-ID: <1282042451.5782.2.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BTW, is this the correct place to post these questions (this and my
"make source" question from last week) or should I be logging a report
in Bugzilla instead?

Ar Luan, 2010-08-16 ag 11:54 +0100, scr?obh Quotient Remainder:
> Ar Sath, 2010-08-14 ag 00:52 +0200, scr?obh Lionel Landwerlin:
> 
> > Why not creating package/Makefile.kmod instead of
> > package/kmod/kmod-common.mk ? We already have a few .mk files there.
> > 
> 
> A lowly contributor such as myself would not dare to dream of the
> dizzying heights of adding a second-level makefile.  ;-}
> But yes, given that it's just a couple of macro definitions it probably
> should be as you say.
> 
> > > The problem is that building a module requires a configured kernel
> > > source.
> > > I thought adding a prerequisite of "linux26" in the module makefile (via
> > > kmod-common.mk) would cause linux to be built and so overcome this but
> > > it is not being built before the modules.
> > > 
> > > I see that linux-fusion has linux26 in its dependency list and that
> > > seems to work so my idea shouldn't be that far-fetched.
> > > Any idea what I'm doing wrong?
> ...
> 
> > > +define KMOD_$(call UPPERCASE,$(1))_BUILD_CMDS
> > > +# Pass KDIR to package makefile so it can reference kernel.
> > > +	$(MAKE) -C $$(@D) KDIR=$$(LINUX26_DIR)
> > > +endef # KMOD_$(call UPPERCASE,$(1))_BUILD_CMDS.
> > > +
> ...
> > Have you tried to cross compile for another architecture ?
> > Because I can't see where you're adding the CROSS_COMPILE parameter.
> > linux/linux.mk defines a LINUX26_MAKE_FLAGS variable, maybe you would
> > like to use it.
> 
> You're right, I forgot this this out.  Actually, I'm cross-compiling all
> the time (for ARM on x86) but I cheated and added a config.mk in the
> kernel source that sets up ARCH, CROSS_COMPILE and INSTALL_MOD_*.  These
> should disappear when I get BR working.
> 
> > Regards,
> > 
> > -- 
> > Lionel Landwerlin
> 
> Thanks for the above advice but I'm still left wondering about my main
> question: why isn't the LINUX26 dependency causing the kernel to be
> built first?
> 
> 
