From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 25 Feb 2011 06:09:50 -0600
Subject: [Buildroot] Question about buildroot generated toolchain
	binaries
In-Reply-To: <AANLkTikLie3Zj9hqYV=BvGEN+efJm0_eVKWbc-66L3wt@mail.gmail.com>
References: <AANLkTikLie3Zj9hqYV=BvGEN+efJm0_eVKWbc-66L3wt@mail.gmail.com>
Message-ID: <201102250609.52237.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu February 24 2011, Steve Johnson wrote:
> Hi,
> 
> In my toolchain output directory I seem to have
> multiple copies of the same binaries..
> In directory /usr/bin I have the gcc compiler (and other binaries) and in
> directory /usr/arm-linux/bin I also have gcc? Why is that?
>

Tradition?  It is the way gcc based toolchains have always installed.

Cross compiler toolchains install with a tuple qualified name and a
tuple qualified path. (yes, twice) At least those based on GCC / BinUtils.

Once upon a time, a long time ago, it was because any toolchain based
on GCC / BinUtils was a supplemental install to the OS vendor's toolchain(s).
That is also where/why the GCC option to compute the toolchain component
name originated.

The tuple qualified path to the cross compiler toolchain could be put first
on the search path and the usual access protocol to binaries on a system
would get the "correct" (desired) toolchain component by bare name only.

The tuple qualified component name could be computed by any of the components
from its own name (arg[0]) and found on the unqualified path.

There may still be some OS out there where this double install feature is
required but it is mostly just of historical interest now.  ;-)

Mike
 
> Thanks,
> 
> Steve
> 
