From: Laurent GONZALEZ <br22@gezedo.com>
Date: Tue, 17 Apr 2018 10:08:53 +0200
Subject: [Buildroot] [PATCH] package/binutils: Cortex-M targets require
 version <2.29
In-Reply-To: <20180417091958.67203679@windsurf.numericable.fr>
References: <da109542-e77b-364e-cd54-12c7bbbcead7@gezedo.com>
 <20180417084904.0a80d93c@windsurf.numericable.fr>
 <51708b71-bb77-623e-31c4-54c5cd678a69@gezedo.com>
 <20180417091958.67203679@windsurf.numericable.fr>
Message-ID: <002260fb-175e-4480-dc63-34ceb4e69021@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/2018 09:19, Thomas Petazzoni wrote:
> On Tue, 17 Apr 2018 09:04:39 +0200, Laurent GONZALEZ wrote: > >> Unfortunately, I think binutils will not change. The new adr >> behavior broke linux kernel, ffmpeg and ssl. Nowadays, only linux >> kernel has not been fixed. We can either avoid bintutils <2.29 or >> patch the kernel. > > Do you have some pointers/references about this issue ? This lkml message is probably the most interresting one in the thread:
http://lists.infradead.org/pipermail/linux-arm-kernel/2017-November/543467.html
> Well, as I said, I'm not really convinced by a solution that > consists in excluding binutils 2.29 and binutils 2.30 for ARMv7-M. > Indeed, once binutils 2.31 is released, we will make binutils 2.30 > the default version, and remove support for binutils 2.28. > > Hence the proper solution is to move forward and fix the kernel > problem, rather than force the use of older binutils. What about:
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-March/565390.html

--
Laurent
