From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 21:57:33 +0100
Subject: [Buildroot] via_imx6_vab820_defconfig fails to build
In-Reply-To: <CAJ3iQcqS2qN9a_hedO-+N+uskH6bOgV2XVWYetD0noG1=s190A@mail.gmail.com>
References: <20161105152208.70041169@free-electrons.com>
 <CAJ3iQcqS2qN9a_hedO-+N+uskH6bOgV2XVWYetD0noG1=s190A@mail.gmail.com>
Message-ID: <CACXmVia4bXVT-j-VCYnGDgurx_FZ5ot-zw1wRx_cnDpYVG5Vow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Sure thing, I still have some access to the platform. I'll check out the
> build failure and send a patch when fixed.

Any news on this? You need to move to kernel 3.18+ for compatibility
with gcc5.x or alternatively backport this commit (and any
dependencies):


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

Do you think you will manage to fix the build issue before the end of
January or should we remove the defconfig?

-- 
Bye, Peter Korsgaard
