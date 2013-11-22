From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 12:56:26 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131122091411.59d82eb5@skate>
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate>
Message-ID: <20131122125626.001168b7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Fri, 22 Nov 2013 09:14:11 +0100, Thomas Petazzoni wrote:

> On Fri, 22 Nov 2013 08:30:02 +0100 (CET), Thomas Petazzoni wrote:
> 
> >     mipsel |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/417dac44eb077079f16a039881a45fa1b1782497/
> >     mipsel |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/20926ed11e7d86cd6c54700eb609b3fa1740b8a7/
> >     mipsel |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/03e5b85c71e5b624e42245f04d305042ec9136fa/
> >     mipsel |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/a51b3723f176a98abff809313a5f863e2539e103/
> 
> Those four ones are the same:
> 
> configure: error: C compiler cannot create executables
> 
> probably a toolchain configuration problem, I need to look into this.

Caused by the deprecation of mips 1, 2, 3 and 4. The toolchain used was
built for mips4, so when linked against code for mips32, it doesn't
work (because apparently, mips32 code isn't compatible with mips4 code).

So I've started rebuilding the set of toolchains on top of 2013.11-rc2,
by replacing the mips4 toolchain by a mips32 toolchain.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
