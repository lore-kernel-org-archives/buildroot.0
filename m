From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 21 Dec 2016 19:22:27 -0500
Subject: [Buildroot] Altera sockit defconfig no longer builds
In-Reply-To: <87a8bp2azt.fsf@dell.be.48ers.dk>
References: <87a8bp2azt.fsf@dell.be.48ers.dk>
Message-ID: <9b3e35df-e723-e7bc-3b33-3e5bb591facc@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Yes i still can have access to this HW platform but not until few weeks
i guess, santa claus time ;).

I will take a look then, you can also remove the defconfig if it doesn't
work anymore and me or somebody else can propose an update working version.

Thanks for your message.

Regards,
Sebastien.

On 12/21/2016 05:06 PM, Peter Korsgaard wrote:
> Hi,
> 
> Back in 2014, you contributed altera_sockit_defconfig to Buildroot.
> Unfortunately, this defconfig no longer builds: the Linux kernel
> version used is too old to build with gcc 5.x.
> 
> Do you still have access to this HW platform? If so, can you contribute
> a patch to update the defconfig? If you're no longer interested by this
> platform, we can also decide to remove its defconfig.
> 
> https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616884
> 
> You need to move to kernel 3.18+ for compatibility with gcc5.x or
> alternatively backport this commit (and any dependencies):
> 
> commit 71458cfc782eafe4b27656e078d379a34e472adf
> Author: Sasha Levin <sasha.levin@oracle.com>
> Date:   Mon Oct 13 15:51:05 2014 -0700
> 
>     kernel: add support for gcc 5
> 
>     We're missing include/linux/compiler-gcc5.h which is required now
>     because gcc branched off to v5 in trunk.
> 
>     Just copy the relevant bits out of include/linux/compiler-gcc4.h,
>     no new code is added as of now.
> 
>     This fixes a build error when using gcc 5.
> 
>     Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
>     Cc: <stable@vger.kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> 
