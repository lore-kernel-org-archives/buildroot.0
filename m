From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 22 Dec 2016 18:30:56 +0100
Subject: [Buildroot] telit_evk_pro3_defconfig fails to build
In-Reply-To: <CACXmVia0ArmYy248oVbg5SZ2uvufyAnktK62Zgm48D+_S04qag@mail.gmail.com>
References: <20161105152013.615d71d7@free-electrons.com>
 <CAHkwnC_jVyVQ27Y6aOr3hLthmUrd70Ep0ufJULB+4jP3zHrYJQ@mail.gmail.com>
 <CACXmVia0ArmYy248oVbg5SZ2uvufyAnktK62Zgm48D+_S04qag@mail.gmail.com>
Message-ID: <CAHkwnC_QU_F6y-65s9X0+qyJD0epuC58yeXAnyUHLW8gAY28ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-12-21 22:02 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
> Hi,
>
>>> Back in 2013, you contributed telit_evk_pro3_defconfig to Buildroot.
>>> Unfortunately, this defconfig no longer builds: the Linux kernel
>>> version used is too old to build with gcc 5.x.
>>
>> I will  try to make a patch to fix it.
>
> Any news on this? You need to update barebox and move to kernel 3.18+
> for compatibility
> with gcc5.x or alternatively backport this commit (and any
> dependencies):
>
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
> Do you think you will manage to fix the build issue before the end of
> January or should we remove the defconfig?

Hi Peter,
thanks for those suggestions,

I'm working to update the barebox and kernel right now, I should be
able to send a fixed version before the end of January.

I've already tried some updated kernels that support gcc 5 (3.10*,
.4.1.*, 4.4.*) but they don't boot anymore, I'm working to fix it.

I've also updated barebox but i've problems with the support for the
watchdog so i'm working to fix it.

Backporting the support for gcc 5 will be my last resort.

Thanks
-- 
Fabio Porcedda
