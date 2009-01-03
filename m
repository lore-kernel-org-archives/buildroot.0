From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 16:02:27 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <495F7ECE.5090903@lbsd.net>
References: <20090103005958.74BCC769FD@busybox.osuosl.org>
	<495F7ECE.5090903@lbsd.net>
Message-ID: <1230994947.8886.89.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-03 klockan 15:05 +0000 skrev Nigel Kukard:
> ulf at uclibc.org wrote:
> > Author: ulf
> > Date: 2009-01-03 00:59:57 +0000 (Sat, 03 Jan 2009)
> > New Revision: 24661
> >
> > Log:
> > Unbreak AVR32 toolchain, by making binutils-2.17 available
> >
> > Modified:
> >    trunk/buildroot/toolchain/binutils/Config.in
> >
> >
> > Changeset:
> > Modified: trunk/buildroot/toolchain/binutils/Config.in
> > ===================================================================
> > --- trunk/buildroot/toolchain/binutils/Config.in	2009-01-03 00:40:02 UTC (rev 24660)
> > +++ trunk/buildroot/toolchain/binutils/Config.in	2009-01-03 00:59:57 UTC (rev 24661)
> > @@ -14,6 +14,10 @@
> >  		depends on BR2_EXT_BINUTILS_VERSION_2_17
> >  		bool "binutils 2.17"
> >  
> > +	config BR2_BINUTILS_VERSION_2_17
> > +		depends on BR2_avr32
> > +		bool "binutils 2.17"
> > +
> >  	config BR2_BINUTILS_VERSION_2_17_50_0_17
> >  		depends on !BR2_avr32 && !BR2_nios2
> >  		depends on BR2_DEPRECATED
> >   
> This causes a warning...
> toolchain/binutils/Config.in:19:warning: choice values currently only
> support a single prompt
> toolchain/binutils/Config.in:14:warning: choice values currently only
> support a single prompt

I made a fix right after this, so it should already work in SVN.
Pls do an svn update and try again.
/Ulf


> 
> 
> Please fix.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
