From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Nov 2013 16:21:30 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131110103235.GE19852@sapphire.tkos.co.il>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <20131110062525.GB1030@sapphire.tkos.co.il>
 <20131110094319.4494c56a@skate>
 <20131110103235.GE19852@sapphire.tkos.co.il>
Message-ID: <20131110162130.73358e89@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 10 Nov 2013 12:32:35 +0200, Baruch Siach wrote:

> > Yes. The UCLIBC_SUSV2_LEGACY symbol was added after 0.9.33.2, so it
> > explains why only Xtensa (which uses the uClibc snapshot version) is
> > affected.
> 
> I see if I can cook up a patch.
> 
> > Maybe we can replace the valloc() call with posix_memalign()
> > and send the patch upstream to cdrkit?
> 
> cdrkit has not see a release in more than 3 years. There are probably other 
> packages making use of the obsolete valloc() routine, so I guess we want to 
> enable UCLIBC_SUSV2_LEGACY anyway.

Fine with me.

> > Also, can you sync up with Chris to provide a patch that makes Xtensa
> > not use a snapshot version, but a fixed version of uClibc (based on a
> > git commit, for example) ? The snapshot version we currently use is
> > really bad, because depending on when you run the build, you will get
> > different build results. This is really not how Buildroot should work:
> > snapshot versions are only provided for expert users who want to test
> > the latest versions of uClibc, such versions shouldn't be used as the
> > default.
> 
> The original patch of Chris adding xtensa support (75720db3, xtensa: add 
> support for the Xtensa architecture) just disabled all other uClibc version 
> for xtensa. The uClibc snapshot just became the version of choice by default.  
> As far as I know any recent master branch commit id could reasonably be used.  
> Should we add an "xtensa only" uClibc version, like the "avr32 only (0.9.31)" 
> version that we now have? Hasn't Bernhard Reutner-Fischer declared some kind 
> of -rc in the uclibc mailing list 
> (http://lists.uclibc.org/pipermail/uclibc/2013-November/048069.html)?

Well, seeing the activity of uClibc, I wouldn't expect an -rc version
or a stable reason any time soon.

Therefore, adding a Xtensa specific uClibc version, pinned to a
specific Git commit, seems like the best option for now.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
