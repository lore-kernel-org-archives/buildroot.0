From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 14:50:29 +0200
Subject: [Buildroot] Cross Toolchain support for blackfin
In-Reply-To: <op.vc1zsjcnyqa4qb@jap-lappis.nevion.com>
References: <4BF6B272.595C.0012.0@lntsec.com>
	<87ljbdv7g2.fsf@macbook.be.48ers.dk>
	<op.vc1zsjcnyqa4qb@jap-lappis.nevion.com>
Message-ID: <20100521145029.3a70fa1a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 May 2010 13:34:57 +0200
Joachim Pihl <jpihl@nevion.com> wrote:

> On Fri, 21 May 2010 13:07:57 +0200, Peter Korsgaard
> <jacmet@sunsite.dk> wrote:
> 
> >>>>>> "TarunJain" == TarunJain SM <TarunJain.SM@lntsec.com> writes:
> >
> >  TarunJain> Hi,
> >
> > Please send mails to the buildroot list, and not directly to me.
> >
> >  TarunJain>  I am planning to build a cross tool chain for blackfin
> >  TarunJain> processor, for which i have download the latest
> >  TarunJain> available "buildroot-2010.02.tar.gz" in which i was
> >  TarunJain> unable to find the target architecture for blackfin,
> >  TarunJain> please guide me to the same.
> >
> > Sorry, we don't have any blackfin support in Buildroot.
> >
> 
> I think the Blackfin toolchain as delivered by Analog Devices is
> based on (an old) Buildroot, maybe you should contact them to try and
> merge their efforts into the mainline?

I don't know how they did in the past, but these days, they use a
custom toolchain build script, documented at
http://docs.blackfin.uclinux.org/doku.php?id=toolchain:buildscript and
available at
http://blackfin.uclinux.org/git/?p=readonly-mirrors/toolchain.git;a=tree;f=buildscript;h=7ff71182924c2a2fc05553bc897c0bd4d53c7349;hb=HEAD.

The toolchains I got from them are not compiled with sysroot support so
they unfortunately can't be used as external toolchains in Buildroot
(which is why I started adding support for Blackfin in CT-NG). However,
their toolchains are higly multilib, something that CT-NG isn't capable
of doing at the moment.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
