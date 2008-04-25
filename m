From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Apr 2008 10:21:38 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  oprofile
In-Reply-To: <20080425064853.GA1525@cloud.net.au> (Hamish Moffatt's message of
	"Fri\, 25 Apr 2008 16\:48\:53 +1000")
References: <20080424165429.5E3993C7F0@busybox.net>
	<87zlrj2khz.fsf@macbook.be.48ers.dk>
	<20080425064853.GA1525@cloud.net.au>
Message-ID: <87fxtaxs31.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> Please use the .patch.avr32 naming convention.

 Hamish> Isn't that only required if the patch is arch-specific, ie it
 Hamish> breaks other architectures? A quick look at the patch
 Hamish> suggests to me that it adds avr32 support to profile without
 Hamish> breaking anything else. Ie it's safe to always apply it.

Maybe, I didn't look at it. Anyway, the safest solution is use the
.patch.avr32 convention, then it certainly cannot harm other archs.

 >> Does that actually work? I mean, does the compiler get recompiled with
 >> C++ support if you select this package after your initial make?

 Hamish> I doubt it.. I think it's quite difficult to get gcc recompiled after
 Hamish> changing the options - usually means deleting most (if not all) of
 Hamish> toolchain_build_$arch.

Then it should be a depends instead.

Anyway, a select here isn't that nice from a usability POV anyway. I
would prefer to get a warning before buildroot would start compiling
in C++ support from me enabling a random package.

-- 
Bye, Peter Korsgaard
