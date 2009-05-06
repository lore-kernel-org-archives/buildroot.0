From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 May 2009 17:17:03 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <20090506124243.GB2496@cbg.dyndns.org> (Steffen Schulz's message
	of "Wed\, 6 May 2009 14\:42\:43 +0200")
References: <20090506124243.GB2496@cbg.dyndns.org>
Message-ID: <87y6tadzww.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:

 Steffen> Hi,

 Steffen> is there any buildroot configuration that gives me a working
 Steffen> X11 using the framebuffer?

 Steffen> I saw updates in the X11 area again for the current rc1, but
 Steffen> I still fail to compile anything using X11.

Strange, it works here ..


 Steffen> Currently, if I select tinyX and xserver, xfont-encodings
 Steffen> will complain about missing mkfontscale. If I add that to
 Steffen> the dependencies, it still complains since the binary is not
 Steffen> copied to staging. Even then it seems some shared libraries
 Steffen> are missing that ldd fails to tell me about.

Hmm, maybe it needs it at build time, E.G. present on the host. Do you
have it installed on your host? Send your .config and I'll give it a
try, we should probably build it for the host as well.

 Steffen> Qtopia simply exists with

 Steffen> The system floating point format could not be detected.
 Steffen> This may cause data to be generated in a wrong format
 Steffen> Turn on verbose messaging (-v) to see the final report.
 Steffen> X/Open Large File support cannot be enabled due to functionality tests!
 Steffen>  Turn on verbose messaging (-v) to ./configure to see the final report.
 Steffen>  If you believe this message is in error you may use the continue
 Steffen>  switch (-continue) to ./configure to continue.

At build time or runtime? Again, send you .config.

 Steffen> I tried this months ago and ran from one problem into the
 Steffen> other, with no end in sight. I'm not particulary good with
 Steffen> autotools, but the regular updates seem to suggest that some
 Steffen> people got this working?

It works here (on real hw and in qemu).

-- 
Bye, Peter Korsgaard
