From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 14:36:08 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <20090508120723.GA28830@cbg.dyndns.org> (Steffen Schulz's message
	of "Fri\, 8 May 2009 14\:07\:23 +0200")
References: <20090506124243.GB2496@cbg.dyndns.org>
	<87y6tadzww.fsf@macbook.be.48ers.dk>
	<20090507082927.GB16268@cbg.dyndns.org>
	<20090508101307.GA18388@cbg.dyndns.org>
	<87skjfanin.fsf@macbook.be.48ers.dk>
	<20090508120723.GA28830@cbg.dyndns.org>
Message-ID: <87fxffai13.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:

Hi,

 Steffen> I guess from --sysroot and i686-linux-uclibc-gcc we can
 Steffen> infer that it is done for the target? I'll be happy to try
 Steffen> to fix it myself if you can give me an example how it is
 Steffen> supposed to be done.

Yes, it's for the target. From a quick look it seems like you should
be able to compile mesa/x86/gen_matypes.c with $(HOSTCC) before
running make, then the Makefile shouldn't try to build it with the
target compiler and will just run the host binary.

-- 
Bye, Peter Korsgaard
