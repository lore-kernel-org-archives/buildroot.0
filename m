From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 21:51:51 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
In-Reply-To: <20160718183059.GA12720@free.fr>
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
 <20160718183059.GA12720@free.fr>
Message-ID: <20160718215151.4948f20d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 20:30:59 +0200, Yann E. MORIN wrote:

> > I have then also picked one other C++ package at random to test with
> > this toolchain, called "bellagio". It also shows the same "configure:
> > error: C++ compiler cannot create executables" error with the
> > autobuilder toolchain.  
> 
> That's because Bellagio also checks for AC_PROG_CXX before AC_PROG_CC:
> 
>     https://sourceforge.net/p/omxil/omxil/ci/master/tree/configure.ac
> 
>     129 # Check for a working C compiler
>     130 AC_PROG_CXX
>     131 AC_PROG_CC
> 
> If you inverse the checks (i.e. AC_PROG_CC then AC_PROG_CXX) it works.
> I also tried that with acpitool, and it indeed fixes the configure issue
> (but then there was the build issue, at which point I bailed out).

Is having AC_PROG_CC called before AC_PROG_CXX a requirement of
autoconf, or a bug in the toolchain?

> > Not sure why the autobuilders haven't ever
> > reported this one, though.  
> 
> There are:
> 
>     http://autobuild.buildroot.org/?reason=bellagio-0.9.3
>     http://autobuild.buildroot.org/results/e9b/e9b18697e3c519d38ea3666f69bed5cf008d772d/
>     http://autobuild.buildroot.org/results/05f/05fa9cb522514e9e5b9e81893f145aab00abd803/
> 
> There's even one such failure on ARM:
>     http://autobuild.buildroot.org/results/f6d/f6db9a9072e19d0632c8e6d64f67248e90f227ce/

I can't even find this toolchain configuration in our history of
autobuilder toolchain configs. Maybe it predates that.

> 
> And on ARC:
>     http://autobuild.buildroot.org/results/203/203eb72ead23ea7930dc1a55dd54a8b3eea5c576/
>     http://autobuild.buildroot.org/results/5d5/5d5fd738f10697985adbc6ed58e6c52ee95b8b33/

Is it reproducible on ARC ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
