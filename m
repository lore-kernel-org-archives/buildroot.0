From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:54:58 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-13
In-Reply-To: <1479160383.4567.1.camel@embedded.rocks>
References: <20161114073015.24C9A20BE0@mail.free-electrons.com>
 <1479160383.4567.1.camel@embedded.rocks>
Message-ID: <20161114225458.72a48b22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 22:53:03 +0100, J?rg Krause wrote:

> > ?????????arm |???????????????????tremor-19427 | NOK |
> > http://autobuild.buildroot.net/results/054f1c77b0e5d46b2dc53769469c0e
> > d03e6b79ef  
> 
> The ARM Cortex-M4 toolchain supports *only* Thumb-2 instructions,
> whereas tremor has ARM assembly code and therefore cannot be build with
> this toolchain.
> 
> I would just exclude the relevant CPU ARMv7-M (BR2_ARM_CPU_ARMV7M) for
> simplicity, right?

Or, better, make tremor not use ARM-only instructions, by disabling the
optimized code. The benefit of this approach is that you don't have to
propagate the !BR2_ARM_CPU_ARMV7M dependency to the reverse
dependencies of tremor.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
