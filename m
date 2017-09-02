From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 18:43:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/libpng: switch to cmake
In-Reply-To: <20170902143908.GA3396@scaer>
References: <20170902142956.22181-1-bernd.kuhls@t-online.de>
 <20170902142956.22181-2-bernd.kuhls@t-online.de>
 <20170902143908.GA3396@scaer>
Message-ID: <20170902184316.666a6986@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Sep 2017 16:39:08 +0200, Yann E. MORIN wrote:

> On 2017-09-02 16:29 +0200, Bernd Kuhls spake thusly:
> > We have no arch-specific options to control mips msa and powerpc vsx
> > support so we disable these options atm to prevent build errors.  
> 
> I'm not even reviewing the patch, because I noticed that a lot of
> switch-to-cmake patches actually broke the build one way or the other.
> 
> So I would suggest that we forgo switching the buildsyustem of package
> just to switch.
> 
> If upstream has changed, or there is a *compelling* reason to switch,
> then so be it. In this case, the commit log *must* explain the rationale
> for switching.
> 
> But switching for the sake of switching is a big no-no from me.

I agree that there needs to be an explanation for the switch. Is
upstream moving to CMake, and getting rid of autotools support in the
future ? Other reason ?

Also Bernd: for libraries, a test-pkg test is by far not enough to
indicate that everything is alright. Look at the switch of cmake in the
lzo package that you contributed: it was bogus because it was only
building the static library, and no longer the shared library. A
test-pkg test doesn't catch this kind of stuff.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
