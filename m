From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Oct 2012 19:44:20 +0100
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <20121031145249.GJ30343@sapphire.tkos.co.il>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
 <20121031114118.GF30343@sapphire.tkos.co.il>
 <20121031153101.41b26063@skate>
 <20121031145249.GJ30343@sapphire.tkos.co.il>
Message-ID: <20121031194420.1e066252@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 31 Oct 2012 16:52:49 +0200, Baruch Siach wrote:

> > I intend to adjust a few things and update it, before resending it.
> > Maybe before the Buildroot meeting this week-end, maybe after.
> 
> Well, this only solves the problem for internal toolchains, isn't it?

No, the intention is to solve the problem for glibc/eglibc toolchains.
The existing support for glibc/eglibc toolchains (both the external
toolchain support and the crosstool-ng backend) assume that if the C
library is glibc or eglibc, then the C library *always* has RPC
support. Starting (e)glibc 2.14 this is no longer correct, so my patch
set takes this into account at the Buildroot level.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
