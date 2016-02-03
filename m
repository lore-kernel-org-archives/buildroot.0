From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:50:41 +0100
Subject: [Buildroot] Question about ARC HS38 core
Message-ID: <20160203235041.75b1a6d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, Lada,

While working on the atomic series [1], Yann and I discovered something
probably wrong in the handling of the HS38 core in Buildroot.

The BR2_ARC_ATOMIC_EXT option is described as below:

# Choice of atomic instructions presence
config BR2_ARC_ATOMIC_EXT
        bool "Atomic extension (LLOCK/SCOND instructions)"
        default y if BR2_arc770d || BR2_archs38

I.e, it makes the atomic extension optional on both the ARC770D and the
ARCHS38 cores.

However, our testing with this option *disabled* shows that:

 * An ARC770D toolchain indeed lacks the atomic intrinsics __sync_*()
   in the compiler, as expected.

 * An ARCHS38 toolchain still has the atomic intrinsics in the compiler.

This leads us to think that ARC HS38 in fact always have the atomic
extension available, regardless of the BR2_ARC_ATOMIC_EXT option.

Could you check this ?

Thanks a lot!

Thomas

[1] http://lists.busybox.net/pipermail/buildroot/2016-February/151672.html
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
