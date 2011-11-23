From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2011 14:54:48 +0100
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <4ECCD481.4030707@relinux.de>
References: <4EBC554E.7050605@gmail.com> <4EBC5656.2010103@gmail.com>
 <4EBD18F1.6020804@relinux.de> <4ECB62C8.6030301@relinux.de>
 <87sjlgplif.fsf@macbook.be.48ers.dk> <4ECCD481.4030707@relinux.de>
Message-ID: <20111123145448.5f5d15b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 23 Nov 2011 12:09:53 +0100,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> To which extend do you expect individual packages being tested on the
> different architectures?

On Blackfin, there are many packages that don't build, because they
simply cannot build on !MMU systems. Our goal is to progressively add
the "depends on BR2_USE_MMU" on all packages that need a MMU to
build/work properly.

So, it's definitely not a problem if not all packages have not been
tested with Microblaze. I'll add a Microblaze toolchain into my
Buildroot testing stuff, it will raise issues, and we will fix them as
we go.

> By now I have a busybox only configuration that can boot with the
> U-Boot available from the Avnet website.
> 
> I can send a patch against buildroot's next branch if desired.

Excellent. Would be good to have :

 * A patch adding the general Microblaze support

 * A patch that adds some defconfig for the Microblaze board you have

 * It would be even better if another patch could add a defconfig for
   the Microblaze Qemu emulation, so that those not having a
   Microblaze board can test.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
