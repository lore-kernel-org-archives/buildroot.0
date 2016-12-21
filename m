From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 23:04:40 +0100
Subject: [Buildroot] Altera socdk defconfig no longer builds
Message-ID: <87eg112b2f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Back in 2015, you contributed altera_socdk_defconfig to Buildroot.
Unfortunately, this defconfig no longer builds: the Linux kernel
version used is too old to build with gcc 5.x.

Do you still have access to this HW platform? If so, can you contribute
a patch to update the defconfig? If you're no longer interested by this
platform, we can also decide to remove its defconfig.

https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616883

You need to move to kernel 3.18+ for compatibility with gcc5.x or
alternatively backport this commit (and any dependencies):

commit 71458cfc782eafe4b27656e078d379a34e472adf
Author: Sasha Levin <sasha.levin@oracle.com>
Date:   Mon Oct 13 15:51:05 2014 -0700

    kernel: add support for gcc 5

    We're missing include/linux/compiler-gcc5.h which is required now
    because gcc branched off to v5 in trunk.

    Just copy the relevant bits out of include/linux/compiler-gcc4.h,
    no new code is added as of now.

    This fixes a build error when using gcc 5.

    Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
    Cc: <stable@vger.kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

-- 
Bye, Peter Korsgaard
