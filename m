From: Daniel Mack <daniel@caiaq.de>
Date: Thu, 26 Mar 2009 00:36:26 +0100
Subject: [Buildroot] External toolchain
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909014E2516@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE1909014E2516@mi8nycmail19.Mi8.com>
Message-ID: <20090325233625.GA20034@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 25, 2009 at 06:14:05PM -0400, H Hartley Sweeten wrote:
> This might not be the correct list to ask this on but I'll try anyway..
> 
> I have been using Buildroot with an external toolchain provided by
> Cirrus Logic for an ARM ep93xx based board. This toolchain has worked
> fine ever since I started using it.

Just curious - why don't you let buildroot build the toolchain for you?

[...]

> Now I have a problem I can't figure out.
> 
> I can get Buildroot to use the Code Sourcery toolchain and it compiles
> the 2.6.29 kernel fine. But, when I try to boot the kernel it just hangs
> after the "Uncompressing Linux.... done, booting the kernel." step.
> 
> I went back to kernel 2.6.28.8 and tried it with the Code Sourcery
> toolchain, same results. But, if I switch back to the Cirrus 4.1.1
> toolchain the kernel boots fine.

We had similar problems discussed on that list just recently. Not sure
whether you're facing exactly the same thing here, but it might be a
pointer.

The problem on other ARM based boards was configurations of gcc using
cpu-specific extensions by default which makes the kernel build system
used them to build the kernel - which eventually results in unbootable
images.

See this thread:

  http://lists.busybox.net/pipermail/buildroot/2009-March/026580.html

Hope that helps :) And if it does, it might be worth including some
proven to work configs in the buildroot repository.

Daniel
