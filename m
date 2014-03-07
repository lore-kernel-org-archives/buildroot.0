From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 14:25:51 +0100
Subject: [Buildroot] [PATCH 6/6] liburcu: disable build with gcc-4.8.x
 on ARM
In-Reply-To: <CAHXCMMLgnj7CEVFnkjjkc=PH9NfXZtDe92tnpo3YwwmTHjk-Qw@mail.gmail.com>
References: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
 <1393717193-19774-7-git-send-email-s.martin49@gmail.com>
 <20140306231723.32e217fd@skate>
 <CAHXCMM+YsCrFrnW06BdJ=AGR3VrUhZb_2UA+NevfdJXF=D+HTg@mail.gmail.com>
 <20140307140423.064ce228@skate>
 <CAHXCMMLgnj7CEVFnkjjkc=PH9NfXZtDe92tnpo3YwwmTHjk-Qw@mail.gmail.com>
Message-ID: <20140307142551.4723159f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 7 Mar 2014 14:14:45 +0100, Samuel Martin wrote:

> > So liburcu checks itself that the gcc version should be different than
> > 4.8.0, 4.8.1 and 4.8.2 ?
> 
> Yes, it's done by this patch:
> http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=4b79310

This patch is a bit stupid. It should actually test for the problem
itself, not make some assumption about the gcc version.

> Just to be clear, your suggestion is only about enabling gcc-4.8.2
> (with the fix), not gcc-4.8.0 nor gcc-4.8.1, right?

We don't support 4.8.0 and 4.8.1 in the internal toolchain backend.

> Then we have to check for each external toolchain if it has the fix.

Yes.

> What about custom toolchain based on gcc-4.8.2? Shall we able it
> (warning the user) or just disabling it?

For custom toolchains, we have absolutely no idea which gcc version is
being used at the Kconfig level, so I don't know how we could disallow
building the package in this case.

That being said, the kernel also mis-compiles on ARM with gcc 4.8.x if
you don't have this fix, and we haven't done anything to prevent people
from building the kernel against unfixed versions of gcc 4.8.x.
Therefore, should we care about liburcu ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
