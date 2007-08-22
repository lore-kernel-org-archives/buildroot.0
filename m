From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 22 Aug 2007 05:46:32 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
In-Reply-To: <20070821231340.GT11697@aon.at>
References: <20070821201424.A0BC1A5D3C@busybox.net>
	<1187727179.6145.34.camel@86-115-11-152>
	<20070821202512.GA21092@aon.at>
	<1187729920.15882.4.camel@86-115-11-152>
	<20070821231340.GT11697@aon.at>
Message-ID: <1187754393.4494.9.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> >
> >Oh, Oh... Yes!
> >
> >It would be nice to have a 64-128 CPU build server making the problem
> > dead obvious :-)
> 
> Since you're most likely I/O bound anyway (you most likely don't build
> in a ramdisk or something that is vaguely fast for IO) there's no point
> in letting your one to eight cores be idle. No need for a 512 CPU box to
> make that obvious.
> >
> >Whatabout:
> >
> >HOSTTOOLS:=host-sed host-lzma
> >ifeq ($(BR2_STRIP_sstrip),y)
> >HOSTTOOLS+=sstrip_host
> >endif
> 
> Except that "HOSTTOOLS" is a too generic name, yes.
> 
> MAYBE_HOST_PREREQ is what i would have used (since lzma should also be
> conditional). Care to do this?
> 

Sure, but skip the "MAYBE_" since the variable contains
the dependencies.
If no BR2_* is set it is emtpy.


> >dependencies:  $(HOSTTOOLS)
> 
> TIA,
-- 
Best Regards,
Ulf Samuelsson
