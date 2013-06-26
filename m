From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:43:09 +0200
Subject: [Buildroot] Sample configurations / test suite ?
Message-ID: <20130627004309.6f15cf53@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Currently, the defconfig that we accept in configs/ are defconfig for
various hardware platforms that should be as minimal as possible: the
bootloader(s), the kernel, Busybox, the right filesystem images and
that's it. Since I've been a fairly strong supporter of this approach,
I continue to believe it makes sense, since there is no way, for a
particular board, to decide which software components should or should
not be part of the default configuration for this board.

However, I am seeing two cases where we would want to have bigger, more
specific defconfig files:

 1) As part of a test suite. Things like building Xenomai, RTAI,
    building a kernel with the various combination (with or without DT,
    etc.) are not tested by our autobuilders, and we've recently had
    reports of Xenomai being broken for example. Having a set of
    configurations that are interesting to build would be very useful,
    and this set could be extended when we think it is necessary (for
    example after receiving a bug report). Those configurations could
    be built on a daily basis, they could have some custom post-image
    script to verify that the build has generated everything that was
    expected, etc.

 2) As part of a set of demonstration defconfigs. For example, Spenser
    Gilliland has recently posted on his blog a defconfig that
    demonstrates how to use OpenMAX on Raspberry Pi to do
    hardware-accelerated video decoding. Maybe it would make sense to
    have a way of storing those "demonstration" configurations
    somewhere, so that they gain in visibility and can more easily be
    re-used by users.

What do you think about this? Do you have ideas on how to implement
this? Should it be part of the Buildroot tree itself, or something
separate? If something separate, how do we keep Buildroot and this
separate tree in sync?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
