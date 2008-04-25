From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 25 Apr 2008 16:48:53 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package:  oprofile
In-Reply-To: <87zlrj2khz.fsf@macbook.be.48ers.dk>
References: <20080424165429.5E3993C7F0@busybox.net>
	<87zlrj2khz.fsf@macbook.be.48ers.dk>
Message-ID: <20080425064853.GA1525@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 24, 2008 at 08:08:56PM +0200, Peter Korsgaard wrote:
> >>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:
> 
>  ninevoltz> Author: ninevoltz
>  ninevoltz> Date: 2008-04-24 09:54:29 -0700 (Thu, 24 Apr 2008)
>  ninevoltz> New Revision: 21847
> 
>  ninevoltz> Log:
>  ninevoltz> add oprofile
> 
>  ninevoltz> Added:
>  ninevoltz>    trunk/buildroot/package/oprofile/
>  ninevoltz>    trunk/buildroot/package/oprofile/Config.in
>  ninevoltz>    trunk/buildroot/package/oprofile/oprofile-0.9.3-avr32.patch
> 
> Please use the .patch.avr32 naming convention.

Isn't that only required if the patch is arch-specific, ie it breaks
other architectures? A quick look at the patch suggests to me that it
adds avr32 support to profile without breaking anything else. Ie it's
safe to always apply it.

> Does that actually work? I mean, does the compiler get recompiled with
> C++ support if you select this package after your initial make?

I doubt it.. I think it's quite difficult to get gcc recompiled after
changing the options - usually means deleting most (if not all) of
toolchain_build_$arch.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
