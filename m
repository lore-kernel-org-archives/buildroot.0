From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 29 Dec 2010 15:02:54 -0600
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <4D19E079.9030704@zacarias.com.ar>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>	<20101224090517.0c935c19@surf>	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
	<4D19E079.9030704@zacarias.com.ar>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBB45@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Oh, bad mips.
> Ok, we need a shared libbfd, i was hoping to get away with a static
one
> but it seems not.
> Fixed in git, pull again and retry.

Okay, that fixed all the toolchain deps.  Everything looks  good in the
new toolchain when compiling with Linux Stable threads, however, it will
not build with Native Posix threads.  I'll work with that later to give
you more information as to what is broken and maybe a way to fix.


As far as oprofile goes, it doesn't build cleanly.  There are several
files that #include "limits.h".  Unfortunately, there are 5 versions of
this file in the include path.  The one that it actually needs is
#include <linux/limits.h>, and changing to this file works.  This seems
to be a common theme with the toolchain -- kexec needs the linux kernel
regdef.h, oprofile needs <linux/limits.h>.

Still poking around, will post more when I have it.

Andy
